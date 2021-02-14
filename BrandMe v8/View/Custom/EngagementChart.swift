//
//  EngagementChart.swift
//  BrandMe v8
//
//  Created by CJ Davis on 12/15/20.
//

import SwiftUI
import iLineChart

struct EngagementChart: View {
    var body: some View {
        iLineChart(
            data: [115, 220, 500, 400, 580, 560, 600, 515, 320, 500, 400, 580, 560, 600, 615, 400, 500, 400, 580, 560, 600],
            title: "My Graph",
            style: .tertiary,
            lineGradient: GradientColor(start: Color.red, end: Color.red),
            chartBackgroundGradient: GradientColor(start: Color.orange, end: .white),
            curvedLines: false,
            displayChartStats: true
        ).frame(width: 400, height: 400, alignment: .center)
    }
}

struct EngagementChart_Previews: PreviewProvider {
    static var previews: some View {
        EngagementChart()
    }
}
