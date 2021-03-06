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
        }
    }
    
}



struct OnboardingView_Previews : PreviewProvider{
    static var previews: some View{
        OnboardingView()
    }
}
