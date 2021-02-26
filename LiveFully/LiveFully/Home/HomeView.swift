//
//  HomeView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/02/21.
//

import Foundation
import SwiftUI

struct HomeView : View{
    var body: some View{
        GeometryReader{ geometry in
            NavigationView{
                ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 8, content: {
                    CountdownView(countdownViewModel: CountdownViewModel(eightyYearsDate: Calendar.current.date(from: DateComponents(year: 2075, month: 8, day: 18))!))
                        .frame(maxHeight: 450)
                        .padding()
                        MotivationPhraseView()
                            .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                        Spacer()
                        .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    userRegardsHeader(userName: "Alessandrooooo")
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
                            .padding(EdgeInsets.init(top: 28, leading: 0, bottom: 0, trailing: 0))
                        })
                        ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "settings")
                            }
                    })
                    
                })
            }
        }
    }
}

    
    func userRegardsHeader(userName : String) -> some View{
        Text("Hello, \(userName)")
            .font(.title)
            .bold()
            .foregroundColor(Color("text"))
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
        //Todo pick random sentences from pool
    }
}

struct HomeView_Preview : PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
