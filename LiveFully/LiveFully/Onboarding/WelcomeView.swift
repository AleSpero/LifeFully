//
//  WelcomeView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 02/03/21.
//

import Foundation
import SwiftUI

struct WelcomeView : View  {
    var body : some View{
        VStack(spacing: 100) {
            HStack {
                Text("Welcome to LiveFully")
                    .font(.largeTitle)
                Image("logo")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            Image("logo")
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised.")
                .padding(.bottom, 24)
        }.padding(24)
    }
}

struct WelcomeView_Preview : PreviewProvider{
    static var previews: some View{
        WelcomeView()
    }
}
