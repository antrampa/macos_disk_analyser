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
            Button("Fetch") {
                let output = try? fetcher.execute("df -k")
                
                print(output ?? "")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
