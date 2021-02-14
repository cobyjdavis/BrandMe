//
//  DragView.swift
//  BrandMe App
//
//  Created by CJ Davis on 11/20/20.
//

import SwiftUI

struct DragView<Content: View>: View {
    
    @GestureState private var dragState = DragState.inactive
    @Binding var position: CardPosition
    
    let gradient = Gradient(colors: [Color("blue-dark"), Color("blue")])
    
    var content: () -> Content
    
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return self.content()
            .frame(height: UIScreen.main.bounds.height)
            .background(LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10)
            .offset(y: self.position.location + self.dragState.translation.height)
            //.animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300, damping: 30, initialVelocity: 10))
            .gesture(drag)
    }
    
    private func onDragEnded(drag: DragGesture.Value){
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = self.position.location + drag.translation.height
        let positionAbove: CardPosition = .top
        let positionBelow: CardPosition = .bottom
        let closestPosition: CardPosition
        
        if(cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBelow
        }
        
        if verticalDirection > 0 {
            self.position = positionBelow
        } else if verticalDirection < 0 {
            self.position = positionAbove
        } else{
            self.position = closestPosition
        }
    }
}

enum CardPosition:CGFloat {
    case top //= 120
    case bottom //= 750
    
    var location: CGFloat {
        switch self {
        case .top:
            return UIScreen.main.bounds.height - 710
        case .bottom:
            return UIScreen.main.bounds.height - 90
        }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation:CGSize{
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
