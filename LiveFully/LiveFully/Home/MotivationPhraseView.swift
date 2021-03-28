//
//  MotivationPhraseView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 26/02/21.
//

import Foundation
import SwiftUI

struct MotivationPhraseView : View{
    var body: some View{
        VStack(alignment: .center, spacing: 6) {
            HStack {
                Image(systemName: "quote.bubble")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 4 , bottom: 0, trailing: 0))
                Spacer()
            }
            Text("You are yourself, and you know what? Being yourself is enough.")
                .font(.title3)
                .fontWeight(.light)
                .lineLimit(3)
                .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 8))
            getRefreshButton()
        }.padding()
    }
}

func getRefreshButton() -> some View{
    return Button(action: {}, label: {
        HStack {
            Image(systemName: "bubble.right.fill") //change this, please
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
            Text("Get another one")
        }
    }).buttonStyle(FilledButtonStyle())
    .padding(EdgeInsets(top: 6, leading: 4, bottom: 0, trailing: 4))
}

struct MotivationPhraseView_Preview : PreviewProvider{
    static var previews: some View{
        MotivationPhraseView()
    }
}
//You are yourself, and you know what? Being yourself is enough.
