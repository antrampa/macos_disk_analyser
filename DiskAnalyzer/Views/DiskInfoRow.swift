//
//  DiskInfoRow.swift
//  DiskAnalyzer
//
//  Created by Antonis on 03/05/2025.
//

import SwiftUI

struct DiskInfoRow: View {
    
    let info: FormattedDiskInfo
    
    var body: some View {
        VStack {
            HStack {
                Text(info.title)
                Spacer()
                Text(info.formattedSize)
                    .font(.system(.body, design: .monospaced))
            }
            
            GeometryReader { proxy in
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                
                Rectangle()
                    .fill(progressColor)
                    .frame(width: proxy.size.width * info.percentage)
            }
            .frame(height: 6)
            .clipShape(Capsule())
        }
    }
    
    var progressColor: Color {
        switch info.title {
            case "System": return .blue
            case "Available": return .green
            default: return .orange
        }
    }
}

struct DiskInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        DiskInfoRow(info: .example)
            .padding()
            .frame(width: 300)
    }
}

//#Preview {
//    DiskInfoRow(inf: .example)
//}
