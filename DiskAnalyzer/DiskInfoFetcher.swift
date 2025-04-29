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
    }
    
    func execute(_ command: String) throws -> String {
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
    
}
