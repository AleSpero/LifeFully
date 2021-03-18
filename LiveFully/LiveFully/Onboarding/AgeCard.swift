//
//  AgeCard.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/03/21.
//

import Foundation
import SwiftUI

struct AgeCard : View{
    
    var age : Int
    var isSelected : Bool = false
    
    var body : some View{
        Card(elevation: 1, alignment: Alignment(horizontal: .center, vertical: .center)){
            Text("Age of \(age)")
                .font(.title2)
                .padding(4)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color("primary"), lineWidth: isSelected ? 3 : 0)
        )
        .padding(6)
    }
}

struct AgeCardView_Preview : PreviewProvider{
    static var previews: some View{
        AgeCard(age: 30)
            .frame(maxHeight: 80)
    }
}
