//
//  DiskAnalyzerApp.swift
//  DiskAnalyzer
//
//  Created by Antonis on 30/04/2025.
//

import SwiftUI

@main
struct DiskAnalyzerApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
                .frame(width: 300)
        } label: {
            Label("Disk Analyzer", systemImage: "externaldrive.connected.to.line.below.fill")
        }
        .menuBarExtraStyle(.window)
        /*
        WindowGroup {
            ContentView()
        }
         */
    }
}
