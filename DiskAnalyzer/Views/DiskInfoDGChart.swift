//
//  DiskInfoDGChart.swift
//  DiskAnalyzer
//
//  Created by Antonis on 03/05/2025.
//
/*
import SwiftUI

struct DiskInfoDGChart: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DiskInfoDGChart_Previews: PreviewProvider {
    static var previews: some View {
        DiskInfoDGChart()
    }
}
 */

/*
import SwiftUI
//import DGCharts // Daniel Gindi Charts (https://github.com/danielgindi/Charts)
//import Charts

struct PieSlice: Shape {
    let startAngle: Angle
    let endAngle: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center,
                    radius: min(rect.width, rect.height) / 2,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        return path
    }
}

struct DiskInfoDGChart: View {
    var diskInfos: [FormattedDiskInfo]
    
    var body: some View {
        GeometryReader { geometry in
            let total = diskInfos.map { $0.percentage }.reduce(0, +)
            let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
            let radius = min(geometry.size.width, geometry.size.height) / 2
            
            ZStack {
                var startAngle = Angle(degrees: 0)
                
                ForEach(diskInfos) { diskInfo in
                    let angle = Angle(degrees: (diskInfo.percentage / total) * 360)
                    let endAngle = startAngle + angle
                    
                    PieSlice(startAngle: startAngle, endAngle: endAngle)
                        .fill(.green)
                    startAngle = endAngle
                }
                
                // Optional: Center Text
                Text("Disk Usage")
                    .font(.headline)
                    .position(center)
            }
        }
        .frame(height: 300)
        .padding()
    }


    
}

*/
