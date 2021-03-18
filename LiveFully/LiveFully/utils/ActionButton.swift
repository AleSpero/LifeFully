//
//  ActionButton.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 26/02/21.
//
//

import Foundation
import SwiftUI

struct ActionButton : View{
    let text : String
    let style: ActionButtonStyle
    let status : ActionButtonStatus //todo disable btn class
    let action : (() -> Void)
    
    var body : some View{
        Button(action: status == .enabled ? action : {}, label: {
            styleButton(text: text, style: style)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(12)
                .background(status == .enabled ? style.backgroundColor : .gray) //todo custom color
                .overlay(
                    RoundedRectangle(cornerRadius: style.cornerRadius)
                    .stroke(style.borderColor, lineWidth: 2)
                )
                .cornerRadius(style.cornerRadius)
        })
    }
    
    private func styleButton(text : String, style: ActionButtonStyle) -> some View{
        return Group{
            if style.icon != nil{
                styleWithIcon(text: text, style: style)
            }
            else {
                getTextComponent(text: text, style: style)
            }
        }
    }
    
    private func styleWithIcon(text : String, style: ActionButtonStyle) -> some View{
        return HStack(alignment: .center, spacing: 6, content: {
            style.iconGravity == .textStart ? style.icon! : AnyView(getTextComponent(text: text, style: style))
            style.iconGravity == .textStart ? AnyView(getTextComponent(text: text, style: style)) : style.icon!
        })
    }
    
    private func getTextComponent(text: String, style: ActionButtonStyle) -> some View{
        return Text(text)
            .font(.callout)
            .bold()
            .foregroundColor(style.textColor)
    }
}

struct ActionButtonStyle {
    let backgroundColor : Color
    let borderColor : Color
    let textColor : Color
    var cornerRadius : CGFloat = 4
    let icon : AnyView?
    var iconGravity : IconGravity = .textStart
}

enum IconGravity{
    case textStart
    case textEnd
}//TODO add btnEnd and btnStart

enum ActionButtonStatus{
    case enabled
    case disabled
}
