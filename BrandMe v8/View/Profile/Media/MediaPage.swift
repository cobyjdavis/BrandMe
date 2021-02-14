//
//  MediaPage.swift
//  BrandMe v8
//
//  Created by CJ Davis on 11/21/20.
//

import SwiftUI

struct Media: View {
    @State var selected : Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var body: some View {
        
        TabView(selection: $selected){
            
            // Images...
            ForEach(1...7,id: \.self){index in
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                    
                    // Geometry Reader For Parallax Effect...
                    
                    GeometryReader{reader in

                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            // moving view in opposite side
                            // when user starts to swipe...
                            // this will create parallax Effect...
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: width, height: height / 2)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "headphones").foregroundColor(.black).font(Font.title2.weight(.bold)).padding().background(Color.white).clipShape(RoundedCorners(tl: 0, tr: 0, bl: 20, br: 0))
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("My Podcasts").foregroundColor(.white).font(.custom("Gilroy-Bold", size: 38)).shadow(radius: 5)
                                HStack {
                                    Image(systemName: "heart.fill").foregroundColor(.white).imageScale(.large).font(Font.title3.weight(.bold)).shadow(radius: 5)
                                    Text("2.6k ∙ Take a listen!").foregroundColor(.white).font(.custom("Gilroy-Bold", size: 24)).shadow(radius: 5)
                                    Spacer()
                                }
                                //Text("My Music").foregroundColor(.white).font(.custom("Gilroy-SemiBold", size: 40)).shadow(radius: 5)
                            }.padding().background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                        }
                            
                    }
                    .frame(height: height / 2)
                    .cornerRadius(25)
                    .padding(5)
                    //.background(Color.white)
                    .cornerRadius(15)
                    // shadow...
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                    // decreasing width by padding...
                    // so outer view only decreased..
                    // inner image will be full width....
                })
                .padding(.horizontal,25)
                
            }
        }
        // page Tab View...
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}


struct UserMedia: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Media()
                }.frame(width: UIScreen.main.bounds.width, height: 500)
//                HStack(alignment: .top, spacing: 20) {
//                    ForEach(14..<19) { media in
//                        GeometryReader { geo in
//                            VStack {
//                                MediaCard(media: media, minX: geo.frame(in: .global).minX)
//                                //Text("\(geo.frame(in: .global).minX / 100)")
//                            }
//                        }.frame(maxHeight: 530).frame(width: 280)
//                    }
//                }.padding(.horizontal).padding(.top, 20).frame(maxHeight: 550)
            }
            Button(action: {}, label: {
                Text("Add Content").font(.custom("Gilroy-SemiBold", size: 24)).foregroundColor(.white).padding(.vertical, 17).padding(.horizontal, 80).background(Color.black.opacity(0.92)).clipShape(Capsule())
            }).shadow(radius: 5)
            Spacer()
        }.frame(maxHeight: 850)
    }
}
struct MediaPage_Previews: PreviewProvider {
    static var previews: some View {
        UserMedia()
    }
}

struct UserMediaGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(1..<10) { media in
                        ZStack(alignment: .topTrailing) {
                            Image("p\(media)").resizable().aspectRatio(contentMode: .fill).frame(width: 110, height: 140, alignment: .center).clipShape(RoundedRectangle(cornerRadius: 20))
                            Image(systemName: "mic.fill").font(Font.body.weight(.semibold)).foregroundColor(.black).shadow(radius: 1).padding(8).background(Color.white).clipShape(Circle()).padding(5)
                        }.frame(width: 110, height: 150, alignment: .center).shadow(radius: 5)
                    }
                }.padding(.horizontal).padding(.top)
                Button(action: {}, label: {
                    Text("Add Content").font(.custom("Gilroy-SemiBold", size: 24)).foregroundColor(.white).padding(.vertical, 17).padding(.horizontal, 60).background(Color.black.opacity(0.92)).clipShape(Capsule())
                }).padding(.top, 20).shadow(radius: 5)
            }
        }
    }
}
