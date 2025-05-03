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
        VStack {
            Text("fetched \(fetcher.diskInfos.count)")
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
    }
}
