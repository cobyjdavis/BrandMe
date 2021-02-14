//
//  CarouselView.swift
//  BrandMe v8
//
//  Created by CJ Davis on 11/20/20.
//

import SwiftUI

struct CarouselView: View {
    
    @GestureState private var dragState = DragStateCarousel.inactive
    @State var carouselLocation = 0
    
    var itemHeight:CGFloat
    var images:[Image]
    
    
    private func onDragEnded(drag: DragGesture.Value) {
        print("drag ended")
        let dragThreshold:CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold{
            carouselLocation =  carouselLocation - 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
        {
            carouselLocation =  carouselLocation + 1
        }
    }
    
    var body: some View {
        ZStack{
//            VStack{
//                Text("\(dragState.translation.width)")
//                Text("Carousel Location = \(carouselLocation)")
//                Text("Relative Location = \(relativeLoc())")
//                Text("\(relativeLoc()) / \(views.count-1)")
//                Spacer()
//            }
            VStack{
                
                ZStack{
                    ForEach(0..<images.count){i in
                        VStack{
                            //Spacer()
                            self.images[i]
                            .resizable()
                            .frame(width:300, height: self.getHeight(i))
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                .background(Color.white)
                            .cornerRadius(40)
                            .shadow(radius: 3)
                            .opacity(self.getOpacity(i))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            .offset(x: self.getOffset(i))
                            .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            //Spacer()
                        }
                    }
                    
                }.gesture(
                    
                    DragGesture()
                        .updating($dragState) { drag, state, transaction in
                            state = .dragging(translation: drag.translation)
                    }
                    .onEnded(onDragEnded)
                    
                )
                
                //Spacer()
            }
            VStack{
                Spacer().frame(height:itemHeight + 50)
                Text("\(relativeLoc() + 1)/\(images.count)").font(.custom("Gilroy-SemiBold", size: 20)).foregroundColor(.gray).padding()
            }
        }
    }
    
    func relativeLoc() -> Int{
        return ((images.count * 10000) + carouselLocation) % images.count
    }
    
    func getHeight(_ i:Int) -> CGFloat{
        if i == relativeLoc(){
            return itemHeight
        } else {
            return itemHeight - 100
        }
    }


    func getOpacity(_ i:Int) -> Double{
        
        if i == relativeLoc()
            || i + 1 == relativeLoc()
            || i - 1 == relativeLoc()
            || i + 2 == relativeLoc()
            || i - 2 == relativeLoc()
            || (i + 1) - images.count == relativeLoc()
            || (i - 1) + images.count == relativeLoc()
            || (i + 2) - images.count == relativeLoc()
            || (i - 2) + images.count == relativeLoc()
        {
            return 1
        } else {
            return 0
        }
    }
    
    func getOffset(_ i:Int) -> CGFloat{
        
        //This sets up the central offset
        if (i) == relativeLoc()
        {
            //Set offset of cental
            return self.dragState.translation.width
        }
            //These set up the offset +/- 1
        else if
            (i) == relativeLoc() + 1
                ||
                (relativeLoc() == images.count - 1 && i == 0)
        {
            //Set offset +1
            return self.dragState.translation.width + (300 + 20)
        }
        else if
            (i) == relativeLoc() - 1
                ||
                (relativeLoc() == 0 && (i) == images.count - 1)
        {
            //Set offset -1
            return self.dragState.translation.width - (300 + 20)
        }
            //These set up the offset +/- 2
        else if
            (i) == relativeLoc() + 2
                ||
                (relativeLoc() == images.count-1 && i == 1)
                ||
                (relativeLoc() == images.count-2 && i == 0)
        {
            return self.dragState.translation.width + (2*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 2
                ||
                (relativeLoc() == 1 && i == images.count-1)
                ||
                (relativeLoc() == 0 && i == images.count-2)
        {
            //Set offset -2
            return self.dragState.translation.width - (2*(300 + 20))
        }
            //These set up the offset +/- 3
        else if
            (i) == relativeLoc() + 3
                ||
                (relativeLoc() == images.count-1 && i == 2)
                ||
                (relativeLoc() == images.count-2 && i == 1)
                ||
                (relativeLoc() == images.count-3 && i == 0)
        {
            return self.dragState.translation.width + (3*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 3
                ||
                (relativeLoc() == 2 && i == images.count-1)
                ||
                (relativeLoc() == 1 && i == images.count-2)
                ||
                (relativeLoc() == 0 && i == images.count-3)
        {
            //Set offset -2
            return self.dragState.translation.width - (3*(300 + 20))
        }
            //This is the remainder
        else {
            return 10000
        }
    }
}

enum DragStateCarousel {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(itemHeight: 500, images: [Image("p14"), Image("p22"), Image("p25")])
    }
}
