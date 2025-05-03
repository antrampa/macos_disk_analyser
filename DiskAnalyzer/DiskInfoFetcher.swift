//
//  DiskInfoFetcher.swift
//  DiskAnalyzer
//
//  Created by Antonis on 30/04/2025.
//

import Foundation

class DiskInfoFetcher: ObservableObject {
    
    enum CommandError: Error {
        case invalidData
        case commandFailed(String)
        case emptyOutput
    }
    
    @Published var diskInfos: [FormattedDiskInfo] = []
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    func getDiskInfo() async throws -> [FormattedDiskInfo] {
        try await Task.detached(priority: .userInitiated) {
            let output = try self.execute("df -k")
            let infos = try self.parse(output)
            let formattedDiskInfos = self.parse(infos)
            return formattedDiskInfos
        }.value
    }
    
    private func execute(_ command: String) throws -> String {
        let process = Process()
        let pipe = Pipe()
        
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", command]
        process.standardOutput = pipe
        
        try process.run()
        process.waitUntilExit()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        
        guard let output = String(data: data, encoding: .utf8) else {
            throw CommandError.invalidData
        }
        
        process.waitUntilExit()
        
        guard process.terminationStatus == 0 else {
            throw CommandError.commandFailed(output)
        }
        
        return output
    }
    
    func parse(_ output: String) throws -> [DiskInfo] {
        let lines = output.components(separatedBy: .newlines)
        guard lines.count > 1 else { throw CommandError.emptyOutput }
        
        //Skip header line
        let dataLines = lines.dropFirst()
        
        return dataLines.compactMap{ line -> DiskInfo? in
            let components = line.split(separator: " ", omittingEmptySubsequences: true)
            guard components.count >= 5 else { return nil }
            
            return DiskInfo(
                fileSystemName: String(components[0]),
                size: (components[1] as NSString).longLongValue ?? 0,  // Now directly in KB
                used: (components[2] as NSString).longLongValue ?? 0,
                available: (components[3] as NSString).longLongValue ?? 0,
                //capacity: (components[4] as NSString).replacingOccurrences(of: "%", with: "")) ?? 0,
                capacity: (components[4].replacingOccurrences(of: "%", with: "") as NSString).integerValue ?? 0,
                mountPoint: components[5...].joined(separator: " ")
            )
        }
    }
    func parse(_ infos: [DiskInfo]) -> [FormattedDiskInfo] {
        var results = [FormattedDiskInfo]()
        
        let total = infos.systemVolume?.size ?? 0
        
        if let systemVolume = infos.systemVolume {
            results.append(
                FormattedDiskInfo(title: "System", size: systemVolume.used, totalSize: total)
            )
        }
        
        if let dataVolumne = infos.dataVolume {
            results.append(
                FormattedDiskInfo(title: "Available", size: dataVolumne.available, totalSize: total)
            )
            
            results.append(
                FormattedDiskInfo(title: "User Data", size: dataVolumne.used, totalSize: total)
            )
        }
        
        return results
    }
    
}
