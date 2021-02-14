//
//  LineChart.swift
//  BrandMe v8
//
//  Created by CJ Davis on 12/14/20.
//

import SwiftUI

struct LineChart: Shape {
    var points: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        func point(at index: Int) -> CGPoint {
            let point = points[index]
            let x = rect.width * CGFloat(index) / CGFloat(points.count - 1)
            let y = (1 - point) * rect.height
            
            return CGPoint(x: x, y: y)
        }
        
        return Path { p in
            guard points.count > 1 else { return }
            let start = points[0]
            p.move(to: CGPoint(x: 0, y:  (1 - start) * rect.height))
            
            for index in points.indices {
                p.addLine(to: point(at: index))
            }
        }
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LineChart(points: [0, 4, 10, 15, 20, 45, 55, 70, 84, 102, 113, 130, 140, 145, 160, 145, 144, 168, 200, 206, 204, 208, 230, 289, 293, 295, 400, 405, 480, 700, 855, 798, 798, 820, 817].normalized)
                .stroke(Color.black, lineWidth: 3)
                .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
        }
    }
}

extension Array where Element == CGFloat {
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max() {
            return self.map { ($0 - min) / (max - min) }
        }
        return []
    }
}


