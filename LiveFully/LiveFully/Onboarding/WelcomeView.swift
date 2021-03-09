//
//  WelcomeView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 02/03/21.
//

import Foundation
import SwiftUI

struct WelcomeView : View  {
    
    @State var needsToGoForward : Bool = false
    
    var body : some View{
    NavigationView{
        VStack(spacing: 80) {
            HStack {
                Text("Welcome to LiveFully")
                    .font(.largeTitle)
                    .fixedSize(horizontal: false, vertical: true)//put this as navbar title?
                Image("logo")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
            Image("logo")
            
            VStack(spacing: 32) {
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised.")
                    .fixedSize(horizontal: false, vertical: true)
                NavigationLink(destination: UserInfoView(), isActive: $needsToGoForward){
                 getNextButton()
                }
            }
            Spacer()
        }.padding(24)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
      }
    }
    
    func getNextButton() -> some View{
        return ActionButton(text: "Next",
                            style: ActionButtonStyle(
                                backgroundColor: Color("primary"),
                                borderColor: Color("primary"),
                                textColor: .white,
                                cornerRadius: 10,
                                icon: AnyView(Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .padding(4)
                                ),
                                iconGravity: .textEnd
                            )){
            self.needsToGoForward = true
        }
    }
}

struct WelcomeView_Preview : PreviewProvider{
    static var previews: some View{
        WelcomeView()
    }
}
