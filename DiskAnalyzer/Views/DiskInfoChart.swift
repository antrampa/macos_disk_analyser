//
//  DiskInfoChart.swift
//  DiskAnalyzer
//
//  Created by Antonis on 03/05/2025.
//

import SwiftUI
import Charts



struct DiskInfoChart: View {
    
    var diskInfos: [FormattedDiskInfo]
    
    var body: some View {
        Chart(diskInfos) { info in
            BarMark(
                x: .value("Type", info.title),
                y: .value("Size %", info.percentage*100)
             )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: info.title),
                    info.title
                )
             )
            .annotation(position: .overlay){
                if info.title != "System" {
                    Text("\(info.percentage * 100, specifier: "%.1f%%")")
                        .bold()
                }
            }
            .cornerRadius(5)
            /*SectorMark(angle: .value(info.title, info.percentage))
                .foregroundStyle(
                    by: .value(
                        Text(verbatim: info.title),
                        info.title
                    )
                )*/
        }
        .chartLegend(position: .trailing, alignment: .center)
    }
}

struct DiskInfoChart_Previews: PreviewProvider {
    static var previews: some View {
        DiskInfoChart(diskInfos: FormattedDiskInfo.examples)
            .padding()
            .frame(width:300, height: 150)
    }
}

