//
//  FormattedDiskInfo.swift
//  DiskAnalyzer
//
//  Created by Antonis on 03/05/2025.
//

import Foundation

struct FormattedDiskInfo: Identifiable {
    
    let id = UUID()
    let title: String
    let size: Int64
    let totalSize: Int64
    
}
