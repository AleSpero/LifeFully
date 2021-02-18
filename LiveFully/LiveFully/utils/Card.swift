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
    
    init(elevation: CGFloat = 4, cornerRadius: CGFloat = 8, alignment: Alignment = Alignment(horizontal: .center, vertical: .center), @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.elevation = elevation
        self.cornerRadius = cornerRadius
        self.contentAlignment = alignment
    }
    
    var body: some View{
        ZStack(alignment: contentAlignment, content: {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(cornerRadius)
                .shadow(radius: elevation)
            //TODO color shadow, pick a lighter shade of dark
            
            content()
        })
    }
}
