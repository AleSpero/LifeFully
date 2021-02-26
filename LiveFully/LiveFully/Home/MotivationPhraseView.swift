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
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: "quote.bubble")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
                //.rotation3DEffect(
                    //Angle(degrees: 180),
                    //axis: (x: 0.0, y: 1.0, z: 0.0)
//)
            Text("You are yourself, and you know what? Being yourself is enough.")
                .font(.title2)
                .fontWeight(.light)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 8))
            getRefreshButton()
        }.padding()
    }
}

func getRefreshButton() -> some View{
    return ActionButton(text: "Get another one",
                        style: ActionButtonStyle(
                            backgroundColor: Color("primary"),
                            borderColor: Color("primary"),
                            textColor: .white,
                            cornerRadius: 12,
                            icon: AnyView(Image(systemName: "arrow.2.circlepath") //change this, please
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 24, height: 20)
                                            .padding(6)
                            )
                        )){
        //Refresh action here
    }.padding(EdgeInsets(top: 12, leading: 4, bottom: 0, trailing: 4))
}

struct MotivationPhraseView_Preview : PreviewProvider{
    static var previews: some View{
        MotivationPhraseView()
    }
}
//You are yourself, and you know what? Being yourself is enough.
