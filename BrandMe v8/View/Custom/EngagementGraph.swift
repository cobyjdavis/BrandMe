//
//  EngagementGraph.swift
//  BrandMe v8
//
//  Created by CJ Davis on 11/21/20.
//

import SwiftUI

struct EngagementGraph: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 25) {
            ForEach(percents){i in
                Bar(percent: i.percent,day: i.day)
            }
        }.padding(.leading, 10).frame(height: 250)
    }
}
struct Bar : View {
      
      var percent : CGFloat = 0
      var day = ""
      
      var body : some View{
          
          VStack{
              
            Text(String(format: "%.0f", Double(percent)) + "k").foregroundColor(Color.black.opacity(0.5)).font(.custom("Gilroy-SemiBold", size: 15))
              
            RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).frame(width: UIScreen.main.bounds.width / 10 - 12, height: getHeight())
              
              Text(day).foregroundColor(Color.black.opacity(0.5)).font(.custom("Gilroy-SemiBold", size: 15))
          }
          
      }
      
      func getHeight()->CGFloat{
          
          return 200 / 100 * percent
      }
  }
struct type : Identifiable {
    
    var id : Int
    var percent :CGFloat
    var day : String
}
var percents = [
  type(id: 0, percent: 100, day: "Mon"),
  type(id: 1, percent: 55, day: "Tue"),
  type(id: 2, percent: 75, day: "Wed"),
  type(id: 3, percent: 25, day: "Thu"),
  type(id: 4, percent: 5, day: "Fri"),
  type(id: 5, percent: 15, day: "Sat"),
  type(id: 6, percent: 65, day: "Sun")
]

struct EngagementGraph_Previews: PreviewProvider {
    static var previews: some View {
        EngagementGraph()
    }
}

