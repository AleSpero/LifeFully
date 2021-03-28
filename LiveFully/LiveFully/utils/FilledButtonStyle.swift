//
//  FilledButtonStyle.swift
//
//  Created by Alessandro Sperotti on 25/03/21.
//

import Foundation
import SwiftUI

struct FilledButtonStyle : ButtonStyle{
    var mainColor : Color = AppTheme.Colors.primary
  var secondaryColor : Color = Color.white
  var font : Font = Font.system(size: 18, weight: .bold, design: .default)
  var pressedColor : Color = AppTheme.Colors.primaryPressed
  var innerSpacing : CGFloat = 16

    
  func makeBody(configuration: Configuration) -> some View {
    FilledButtonStyleView(mainColor: mainColor, secondaryColor: secondaryColor, font: font, innerSpacing: innerSpacing, configuration: configuration)
  }
    
  struct FilledButtonStyleView : View{
    
    var mainColor : Color = AppTheme.Colors.primary
    var secondaryColor : Color = Color.white
    var font : Font = Font.system(size: 18, weight: .bold, design: .default)
    var pressedColor : Color = AppTheme.Colors.primaryPressed
    var innerSpacing : CGFloat = 16
    
    
    @Environment(\.isEnabled) var isEnabled
    let configuration: FilledButtonStyle.Configuration
    var body : some View{
      configuration.label
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(innerSpacing)
        .font(font)
        .foregroundColor(secondaryColor)
        .background(RoundedRectangle(cornerRadius: 10)
                        .fill(isEnabled ? (configuration.isPressed ? pressedColor : mainColor) : mainColor))
        .opacity(isEnabled ? 1.0 : 0.7)
    }
  }
}
