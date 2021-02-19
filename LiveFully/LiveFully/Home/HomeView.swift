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
                        .frame(maxHeight: 425)
                        .padding()
                        .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading, content: {
                            HStack(alignment: .center, spacing: 12, content: {
                                Text("Live Fully")
                                    .bold()
                                    .font(.largeTitle)
                            })
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
            .font(.title2)
            .bold()
            .foregroundColor(Color("text"))
            .lineLimit(2)
            .padding(EdgeInsets.init(top: 2, leading: 16, bottom: 4, trailing: 16))
        //Todo pick random sentences from pool
    }
}

struct HomeView_Preview : PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}
