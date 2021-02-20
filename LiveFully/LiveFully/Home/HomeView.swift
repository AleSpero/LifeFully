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
        NavigationView{
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 8, content: {
                    happySentenceHeader(userName: "Alessandro")
                    CountdownView(countdownViewModel: CountdownViewModel(eightyYearsDate: Calendar.current.date(from: DateComponents(year: 2075, month: 8, day: 18))!))
                        .frame(maxHeight: 410)
                        .padding()
                        Spacer()
                        .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            HStack(alignment: .center, spacing: 12, content: {
                                Text("LiveFully")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(Color("text"))
                                Image("logo")
                                    .resizable()
                                    .frame(width: 42, height: 45, alignment: .center)
                            }).padding(EdgeInsets.init(top: 48, leading: 0, bottom: 0, trailing: 0))
                        })
                        ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "settings")
                            }
                    })
                    
                })
            }
        }
    }

    
    func happySentenceHeader(userName : String) -> some View{
        Text("Hello \(userName), have a great day ❤️")
            .font(.title3)
            .bold()
            .foregroundColor(Color("text"))
            .lineLimit(2)
            .padding()
        //Todo pick random sentences from pool
    }
}

struct HomeView_Preview : PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
