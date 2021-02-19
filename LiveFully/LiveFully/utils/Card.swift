//
//  Card.swift
//  StonksApp
//
//  Created by Alessandro Sperotti on 12/02/21.
//
import Foundation
import SwiftUI

struct Card<Content : View> : View {
    
    let content : () -> Content
    let elevation : CGFloat
    let cornerRadius : CGFloat
    let contentAlignment : Alignment
    let backgroundColor : Color
    
    init(elevation: CGFloat = 4, cornerRadius: CGFloat = 8, alignment: Alignment = Alignment(horizontal: .center, vertical: .center), backgroundColor : Color = Color.white, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.elevation = elevation
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.contentAlignment = alignment
    }
    
    var body: some View{
        ZStack(alignment: contentAlignment, content: {
            Rectangle()
                .fill(backgroundColor)
                .cornerRadius(cornerRadius)
                .shadow(radius: elevation)
            //TODO color shadow, pick a lighter shade of dark
            
            content()
        })
    }
}
