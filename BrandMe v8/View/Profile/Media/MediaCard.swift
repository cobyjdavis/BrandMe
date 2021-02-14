//
//  MediaCard.swift
//  BrandMe v8
//
//  Created by CJ Davis on 11/21/20.
//

import SwiftUI

struct MediaCard: View {
    
    var media: Int
    var minX: CGFloat
    
    var body: some View {
        ZStack {
            Image("p\(media)").resizable().aspectRatio(contentMode: .fill)
            
            VStack(alignment: .trailing) {
                Button(action: {}, label: {
                    Image(systemName: "headphones").foregroundColor(.white).font(Font.title2.weight(.semibold))//.padding(8).background(Color.white).clipShape(Circle()).shadow(radius: 5)
                }).padding()
                Spacer()
                VStack(alignment: .leading) {
                    Text("PHOTOSHOOT XII").font(.custom("Gilroy-SemiBold", size: 24)).foregroundColor(.white).shadow(radius: 5)
                    Text("This is an example caption and will display in the bottom of the media. ").font(.custom("Gilroy-SemiBold", size: 13)).foregroundColor(.white).shadow(radius: 5).lineLimit(4)
                }.padding().background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
            }.frame(width: 290)
        }.frame(width: 280, height: 500, alignment: .center).clipShape(RoundedRectangle(cornerRadius: 30)).shadow(radius: 5)
    }
}

//struct MediaCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MediaCard()
//    }
//}
