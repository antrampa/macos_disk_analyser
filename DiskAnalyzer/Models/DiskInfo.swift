//
//  DiskInfo.swift
//  DiskAnalyzer
//
//  Created by Antonis on 03/05/2025.
//

import Foundation

struct DiskInfo {
    
    let fileSystemName: String
    let size: Int64
    let used: Int64
    let available: Int64
    let capacity: Int
    let mountPoint: String
    
    var isSystemVolume: Bool {
        fileSystemName == "/"
    }
    
    var isDataVolume: Bool {
        fileSystemName == "/System/Volumes/Data"
    }
}

// MARK: - Analysis Extension
extension Array where Element == DiskInfo {
    var systemVolume: DiskInfo? {
        first { $0.isSystemVolume }
    }
    
    var dataVolume: DiskInfo? {
        first { $0.isDataVolume }
    }
}
