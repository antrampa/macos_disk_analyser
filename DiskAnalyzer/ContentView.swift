//
//  ContentView.swift
//  DiskAnalyzer
//
//  Created by Antonis on 30/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var fetcher = DiskInfoFetcher()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Disk Analyzer")
                .font(.title2)
                .bold()
            
            DiskInfoListView(diskInfos: fetcher.diskInfos)
            
            DiskInfoChart(diskInfos: fetcher.diskInfos)
        }
        .padding()
        .task {
            do {
                fetcher.diskInfos = try await fetcher.getDiskInfo()
            } catch {
                fetcher.error = error
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 300, height: 600)
    }
}
