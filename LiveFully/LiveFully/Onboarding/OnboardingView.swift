//
//  OnboardingView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 02/03/21.
//

import Foundation
import SwiftUI

struct OnboardingView : View{
    var body: some View{
        VStack {
            TabView{
                //investigate on why paged tabview sucks, eventually use different controllers with route (probably this)
                WelcomeView()
                UserInfoView(birthDate: Date())
                AgeGoalView()
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            getNextButton()
        }
    }
    
    func getNextButton() -> some View{
        return ActionButton(text: "Next",
                            style: ActionButtonStyle(
                                backgroundColor: Color("primary"),
                                borderColor: Color("primary"),
                                textColor: .white,
                                cornerRadius: 10,
                                icon: AnyView(Image(systemName: "bubble.right.fill") //change this, please
                                                .resizable()
                                                .foregroundColor(.white)
                                                .frame(width: 18, height: 18)
                                                .padding(4)
                                )
                            )){
            //Refresh action here
        }.padding()
    }
}



struct OnboardingView_Previews : PreviewProvider{
    static var previews: some View{
        OnboardingView()
    }
}
