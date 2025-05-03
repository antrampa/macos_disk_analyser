//
//  DiskInfoListView.swift
//  DiskAnalyzer
//
//  Created by Antonis on 03/05/2025.
//

import SwiftUI

struct DiskInfoListView: View {
    
    var diskInfos: [FormattedDiskInfo]
    
    var body: some View {
        GroupBox {
            ForEach(diskInfos) { info in
                DiskInfoRow(info: info)
            }
            .listRowSeparator(.hidden)
        } label: {
            Text("Disk Space Overview")
        }
    }
}

struct DiskInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        DiskInfoListView(diskInfos: [FormattedDiskInfo.example])
            .frame(width: 300, height: 300)
            
    }
}
