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
        TabView{
            WelcomeView()
            UserInfoView()
            AgeGoalView()
        }.tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct OnboardingView_Previews : PreviewProvider{
    static var previews: some View{
        OnboardingView()
    }
}
