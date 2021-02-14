//
//  ContentView.swift
//  BrandMe v8
//
//  Created by CJ Davis on 11/20/20.
//

import SwiftUI
import Pages
import Grid

struct ContentView: View {
    
    @State var pageIndex = 1
    @State var index = 0
    
    var body: some View {
        if index == 0 {
            Profile(index: $index)
        } else {
            Search(index: $index)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Search: View {
    @State var searching = true
    @State var searchText = ""
    @Binding var index: Int
    var trendingTags = ["bball", "best ever", "singers", "profitable", "who", "dancers", "college sports", "KD", "Ryan Garcia", "Tank Davis", "Brent Faiyaz", "NewBrandDeals", "AUCTION-X500"]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Image(systemName: "magnifyingglass").foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                    }.padding(.horizontal).padding(.vertical, 7).background(Color.lightGray.opacity(0.5)).clipShape(RoundedRectangle(cornerRadius: 5)).padding(.horizontal)
                    Button(action: { index = 0 }, label: {
                        Image(systemName: "xmark").foregroundColor(.white).font(Font.body.weight(.semibold)).padding(12).background(Color.black).clipShape(Circle()).shadow(radius: 5)
                    })
                }.padding(.trailing)
                HStack {
                    Text("Top Brands").font(.custom("Gilroy-SemiBold", size: 23)).foregroundColor(.black)
                    Spacer()
                    Image(systemName: "ellipsis").foregroundColor(.black)
                }.padding([.horizontal, .top])
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 20) {
                        ForEach(1..<11) { tb in
                            ZStack(alignment: .bottomLeading) {
                                Image("p\(tb)").resizable().scaledToFill().frame(width: 150, height: 200, alignment: .center)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("\(tb)").font(.custom("Gilroy-Bold", size: 40)).foregroundColor(.white).shadow(radius: 10).padding()
                                        Spacer()
                                    }.background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom))
                                    Spacer()
                                    VStack(alignment: .leading) {
                                        Text("Username").font(.custom("Gilroy-Bold", size: 20)).foregroundColor(.white)
                                        HStack(spacing: 0) {
                                            Text("Athlete ∙ 575k").font(.custom("Gilroy-Bold", size: 13)).foregroundColor(.white)
                                            Image(systemName: "bolt.fill").foregroundColor(.yellow).imageScale(.medium)
                                        }
                                    }.padding(.leading, 10).padding(.top).background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
                                }
                            }.clipShape(RoundedRectangle(cornerRadius: 20)).shadow(radius: 1).overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 0.3))
                        }
                    }.padding(.horizontal)
                })
                HStack {
                    Text("Trending").font(.custom("Gilroy-SemiBold", size: 23)).foregroundColor(.black)
                    Spacer()
                    Image(systemName: "ellipsis").foregroundColor(.black)
                }.padding([.horizontal, .top])
                ScrollView(.horizontal, showsIndicators: false) {
                    Grid(trendingTags, id: \.self) { tag in
                        Button(action: {}, label: {
                            Text("#\(tag)").font(.custom("Gilroy-SemiBold", size: 14)).foregroundColor(.black).padding(.horizontal).padding(.vertical, 12).background(Color.lightGray.opacity(0.6)).clipShape(Capsule())
                        })
                    }.gridStyle(
                        StaggeredGridStyle(.horizontal, tracks: 2, spacing: 8)
                    ).frame(height: 90).padding(.leading)
                }
                HStack {
                    Text("News").font(.custom("Gilroy-SemiBold", size: 23)).foregroundColor(.black)
                    Spacer()
                    Image(systemName: "ellipsis").foregroundColor(.black)
                }.padding([.horizontal, .top])
                ZStack(alignment: .bottomLeading) {
                    Image("p29").resizable().scaledToFill().frame(width: UIScreen.main.bounds.width - 30, height: 250, alignment: .center).clipShape(RoundedRectangle(cornerRadius: 20))
                    VStack(alignment: .leading, spacing: 3) {
                        Text("BrandMe Taking Over").font(.custom("Gilroy-Bold", size: 23)).foregroundColor(.white).shadow(radius: 5)
                        Text("This superstar is ready to show the world why they are the best at what they do! Their brand is hot right now! Will it ever cool off?").font(.custom("Gilroy-SemiBold", size: 15)).foregroundColor(.white).frame(width: UIScreen.main.bounds.width - 60).shadow(radius: 5)
                    }.padding().padding(.top).background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.7), Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)).clipShape(RoundedRectangle(cornerRadius: 20))
                }.padding(.leading)
            }
        }
    }
}

struct Profile: View {
    @Binding var index: Int
    @State var tabIndex = 0
    @State var position: CardPosition = .bottom
    var screenSize = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("p1").resizable().aspectRatio(contentMode: .fill).frame(width: screenSize.width, height: screenSize.height, alignment: .center).clipped()
            
            VStack {
                HStack {
                    Button(action: { self.index = 0 }, label: {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "lineweight").foregroundColor(.black).imageScale(.small).font(Font.title2.bold()).padding(15).background(Color.white).clipShape(Circle()).shadow(radius: 1)
                            Circle().fill(Color.blue).frame(width: 15, height: 15, alignment: .center).overlay(Circle().stroke(Color.white, lineWidth: 3))
                        }
                    })
                    
                    Spacer()
                    
                    if position == .bottom {
                        // User Stats
                        HStack(spacing: 8) {
                            VStack {
                                Text("23k").font(.custom("Gilroy-SemiBold", size: 22)).foregroundColor(.white).shadow(radius: 5)
                                Text("Subscribers").font(.custom("Gilroy-SemiBold", size: 11)).foregroundColor(.white).shadow(radius: 5)
                            }
                            RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(width: 2, height: 30)
                            VStack {
                                Text("49k").font(.custom("Gilroy-SemiBold", size: 22)).foregroundColor(.white).shadow(radius: 5)
                                Text("Engagements").font(.custom("Gilroy-SemiBold", size: 11)).foregroundColor(.white).shadow(radius: 5)
                            }
                            RoundedRectangle(cornerRadius: 20).fill(Color.white).frame(width: 2, height: 30)
                            VStack {
                                Text("857").font(.custom("Gilroy-SemiBold", size: 22)).foregroundColor(.white).shadow(radius: 5)
                                Text("Endorsers").font(.custom("Gilroy-SemiBold", size: 11)).foregroundColor(.white).shadow(radius: 5)
                            }
                        }.padding(.horizontal, 10)
                    } else {
                        HStack {
                            Text("Sevaní Leo").font(.custom("Gilroy-SemiBold", size: 30)).foregroundColor(.white).shadow(radius: 5).opacity(position == .top ? 1 : 0).animation(.easeInOut)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { index = 1 }, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(.black).imageScale(.small).font(Font.title2.bold()).padding(14).background(Color.white).clipShape(Circle()).shadow(radius: 5)
                    })
                }.padding(.top, 50).padding(.horizontal).padding(.bottom, 30).background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom))
                Spacer()
            }
            
            if position == .bottom {
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Sevaní Leo").font(.custom("Gilroy-Bold", size: 34)).foregroundColor(.white).shadow(radius: 5)
                                Image(systemName: "checkmark.seal.fill").foregroundColor(.green).imageScale(.large).shadow(radius: 5)
                            }
                            // User fullname
                            Text("Musician • Los Angeles, CA").font(.custom("Gilroy-Bold", size: 18)).foregroundColor(.white).shadow(radius: 5) // User brand type and location
                        }.padding(.trailing)
                        //Spacer()
                        
                        Button(action: { self.index = 0 }, label: {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "bell.fill").foregroundColor(.black).imageScale(.small).font(Font.title3.bold()).padding(14).background(Color.white).clipShape(Circle()).shadow(radius: 1)
                                Circle().fill(Color.blue).frame(width: 17, height: 17, alignment: .center).overlay(Circle().stroke(Color.white, lineWidth: 3))
                            }
                        })
                        
                        ExpandableButtonPanel(
                          primaryItem: ExpandableButtonItem(label: "ellipsis"), // No action
                          secondaryItems: [
                            ExpandableButtonItem(label: "bubble.left.and.bubble.right.fill") {
                              // Can add action, if necessary
                            },
                            ExpandableButtonItem(label: "gearshape.fill") {
                              // Can add action, if necessary
                            },
                            ExpandableButtonItem(label: "signature") {
                              // Can add action, if necessary
                            }
                          ]
                        )
                        
//                        Button(action: {}, label: {
//                            Text("Subscribe").foregroundColor(.white).font(.custom("Gilroy-SemiBold", size: 18)).padding(.horizontal, 24).padding(.vertical, 9).overlay(Capsule().stroke(Color.white, lineWidth: 2))
//                        })
                    }
                    Text("I am a 23 year old singer born in California. Currently signed to No Limit Record Label. I love all my supporters! Giveaways every month. ").font(.custom("Gilroy-SemiBold", size: 18)).foregroundColor(.white).shadow(radius: 5).padding(.top, 2).lineLimit(3) // User short description
                }.padding().padding(.bottom, 50).background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom)).offset(y: -40)
            }
            
            DragView(position: $position) {
                    VStack {
                        
                        RoundedRectangle(cornerRadius: 20).fill(Color.gray).frame(width: 40, height: 6, alignment: .center).padding(.top).padding(.bottom, 8)
                        
                        HorizontalTabs(tabs: ["Media", "Promos", "Events", "Premium"], selectedIndex: $tabIndex).animation(.none)
                        
                        if tabIndex == 0 {
                            UserMedia()
                            //UserMediaGrid()
                        } else if tabIndex == 1 {
                            UserPromos()
                        } else {
                            UserEvents(position: $position)
                            //UserEvents2()
                        }
                    }.background(Color.white)
            }
        }.frame(width: screenSize.width, height: screenSize.height, alignment: .center).edgesIgnoringSafeArea(.all)
    }
}
 
struct UserPromos: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10) { _ in
                        RoundedRectangle(cornerRadius: 20).fill(Color.black).frame(width: 180, height: 240, alignment: .center).opacity(0.1).shadow(radius: 5)
                    }
                }.padding(.leading).padding(.top)
            }
            /* Engagement Bar Chart */
            HStack {
                Text("Daily Engagement").font(.custom("Gilroy-SemiBold", size: 30)).foregroundColor(.black).padding(.bottom).padding(.top, 5).padding(.leading).padding(.top)
                Spacer()
            }
            EngagementGraph().padding(.trailing)
            Spacer()
        }
    }
}

struct UserEvents: View {
    
    @Binding var position: CardPosition
    @State var date = Date()
    @State var data: DateType!
    
    var body: some View {
        VStack {
            HStack(spacing: 18) {
                ForEach(11..<16) { i in
                    VStack {
                        if self.data != nil {
                            Text("\(i)").font(.custom("Gilroy-SemiBold", size: 30)).foregroundColor(i == 11 ? .white : .black)
                            Text(data.day).font(.custom("Gilroy-SemiBold", size: 20)).foregroundColor(i == 11 ? .white : .gray)
                        }
                    }.padding(10)
                    .background(i == 11 ? Color.black : .clear)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 2)
                    )
                }
            }.padding(.top)
            ScrollView {
                LazyVStack {
                    ForEach(13..<20) { event in
                        HStack(alignment: .top) {
                            if event % 2 == 0 {
                                EventInformation(event: event)
                                Spacer()
                            }
                            Image("p\(event)").resizable().aspectRatio(contentMode: .fill).frame(width: 150, height: 160, alignment: .center).clipShape(RoundedRectangle(cornerRadius: 20))
                            if event % 2 != 0 {
                                EventInformation(event: event)
                                Spacer()
                            }
                        }.padding()
                    }
                }.padding(.bottom, 150)
            }.padding(.top, position == .top ? 0 : 20)
            .onAppear {
                updateData()
            }
        }
    }
    
    func updateData() {
        let current = Calendar.current
        let date = current.component(.day, from: self.date)
        let monthNo = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNo - 1]
        let year = current.component(.year, from: self.date)
        let weekNo = current.component(.weekday, from: self.date)
        let day = current.shortWeekdaySymbols[weekNo - 1]
        
        self.data = DateType(day: day, date: "\(date)", month: month, year: "\(year)")
    }
}

struct DateType {
    var day: String
    var date: String
    var month: String
    var year: String
}

struct EventInformation: View {
    
    var event: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Event \(event)").font(.custom("Gilroy-SemiBold", size: 32)).foregroundColor(.black).lineLimit(1)
            Text("Los Angeles, CA ∙ 7/9/2020").font(.custom("Gilroy-SemiBold", size: 15)).foregroundColor(.gray).lineLimit(1)
            //Text("12:00 p.m").font(.custom("Gilroy-SemiBold", size: 15)).foregroundColor(.gray).lineLimit(1)
            Text("This is where the details of the event will go! User can also add any other information concerning the event here as well. Come out and have fun! Looking to be great!").font(.custom("Gilroy-SemiBold", size: 15)).foregroundColor(Color.black.opacity(0.8)).padding(.top, 1).lineLimit(7)
        }
    }
}


struct UserEvents2: View {
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: -15) {
                    ForEach(10..<20) { event in
                        HStack(alignment: .top) {
                            VStack {
                                Text("Sep 2").font(.custom("Gilroy-SemiBold", size: 20)).foregroundColor(.black).lineLimit(1)
                            }.padding(.top, 10)
                            Spacer()
                            ZStack(alignment: .leading) {
                                Image("p\(event)").resizable().aspectRatio(contentMode: .fill).frame(width: 290, height: 200, alignment: .center)
                                VStack {
                                    HStack {
                                        Spacer()
                                        Image(systemName: "bookmark.fill").foregroundColor(.white).imageScale(.large)
                                    }.padding()
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("Rose Bowl Game 2020").font(.custom("Gilroy-SemiBold", size: 22)).foregroundColor(.white).lineLimit(1)
                                        Text("Los Angeles, CA ∙ 7/9/2020").font(.custom("Gilroy-SemiBold", size: 15)).foregroundColor(.white).lineLimit(1)
                                    }.padding(.horizontal).padding(.bottom, 4).background(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
                                }
                            }.clipShape(RoundedRectangle(cornerRadius: 25)).shadow(radius: 5)
                        }.padding(20)
                    }
                }
            }
        }
    }
}
