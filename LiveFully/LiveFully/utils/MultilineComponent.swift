//
//  MultilineComponent.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/02/21.
//

import Foundation
import SwiftUI

struct MultiLineLabel : View{
    
    init(upperTextContent: String, lowerTextContent: String, textColors: [Color]? = nil, fonts: [Font]? = nil, verticalSpacing : CGFloat = 0){
        self.textContent.append(upperTextContent)
        self.textContent.append(lowerTextContent)
        
        if let safeColors = textColors{
            self.textColors = safeColors
        }
        if let safeFonts = fonts{
            self.fonts = safeFonts
        }
        self.verticalSpacing = verticalSpacing
    }
    var verticalSpacing : CGFloat = 0
    var textContent : [String] = []
    var textColors = [Color.black, Color.black]
    var fonts : [Font] = [.title, .subheadline]
    
    var body : some View{
        VStack(alignment: .leading, spacing: verticalSpacing, content: {
            Text(textContent.first ?? "")
            .font(fonts.first)
            .animation(nil)
            .foregroundColor(textColors.first)
            Text(textContent.last ?? "")
              .font(fonts.last)
              .animation(nil)
              .foregroundColor(textColors.last)
        })
    }
}
