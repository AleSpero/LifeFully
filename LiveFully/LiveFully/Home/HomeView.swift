//
//  HomeView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/02/21.
//

import Foundation
import SwiftUI

struct HomeView : View{
    
    let countdownViewModel = CountdownViewModel(targetDate: LiveFullyDefaults.targetDate ?? Date())

    
    var body: some View{
        GeometryReader{ geometry in
            NavigationView{
                ZStack {
                VStack(alignment: .center, spacing: 16, content: {
                    CountdownView(countdownViewModel: countdownViewModel)
                        .frame(maxHeight: 370)
                        .padding()
                        MotivationPhraseView()
                            .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                        .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    userRegardsHeader(userName: LiveFullyDefaults.userName ?? "")
                                }
                                HStack(alignment: .bottom, spacing: 4, content: {
                                    Text("Remember to... ")
                                        .font(.subheadline) +
                                    Text("LiveFully")
                                        .fontWeight(.light)
                                        .font(.body)
                                        .foregroundColor(Color("text"))
                                    Image("logo")
                                        .resizable()
                                        .frame(width: 20, height: 24, alignment: .center)
                                })
 
                            }
                            .padding(.top, 90)
                        })
                        ToolbarItem(placement: .navigationBarTrailing) {
                                Image("gear")
                                    .foregroundColor(Color("text"))
                                    .padding(.top, 90)
                            }
                    })
                    
                })
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

    
    func userRegardsHeader(userName : String) -> some View{
        Text("Hello, \(userName)")
            .font(.title)
            .bold()
            .foregroundColor(Color("text"))
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
        //Todo pick random sentences from pool (quotes API!)
    }
}

struct HomeView_Preview : PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
