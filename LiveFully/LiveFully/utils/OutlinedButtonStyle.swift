//
//  OutlinedButtonStyle.swift
//
//  Created by Alessandro Sperotti on 25/03/21.
//

import Foundation
import SwiftUI

struct OutlinedButtonStyle : ButtonStyle{
  let mainColor : Color
  var strokeWidth : CGFloat = 3
  var font : Font = Font.system(size: 18, weight: .bold, design: .default)
  var pressedColor : Color = AppTheme.Colors.primaryPressed
  var innerSpacing : CGFloat = 16

    
  func makeBody(configuration: Configuration) -> some View {
    OutlinedButtonStyleView(mainColor: mainColor, strokeWidth: strokeWidth, font: font, pressedColor: pressedColor, innerSpacing: innerSpacing, configuration: configuration)
  }
    
  struct OutlinedButtonStyleView : View{
    
    let mainColor : Color
    var strokeWidth : CGFloat = 3
    var font : Font = Font.system(size: 18, weight: .bold, design: .default)
    var pressedColor : Color = AppTheme.Colors.primaryPressed
    var innerSpacing : CGFloat = 16
    
    
    @Environment(\.isEnabled) var isEnabled
    let configuration: OutlinedButtonStyle.Configuration
    var body : some View{
      configuration.label
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(innerSpacing)
        .font(font)
        .foregroundColor(mainColor)
        .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(mainColor, lineWidth: strokeWidth)
                        .background(configuration.isPressed ? pressedColor : .clear))
        .opacity(isEnabled ? 1.0 : 0.9)
    }
  }
}
