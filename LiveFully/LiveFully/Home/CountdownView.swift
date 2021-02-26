//
//  CountdownView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/02/21.
//

import Foundation
import SwiftUI

struct CountdownView : View{
    @ObservedObject var countdownViewModel : CountdownViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let upperLabelFont = Font.system(size: 35)
    let lowerLabelFont = Font.system(size: 14)
    
    var body: some View{
            Card(alignment: Alignment(horizontal: .leading, vertical: .top),
                 backgroundColor: Color("surface"),
                 content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("You have...")
                        .foregroundColor(Color("primary"))
                        .font(.title3)
                        .bold()
                        MultiLineLabel(
                            upperTextContent: countdownViewModel.getRemainingTime(for: .nanosecond), lowerTextContent: "Seconds",
                            fonts: [upperLabelFont, lowerLabelFont], verticalSpacing: -4)
                        MultiLineLabel(
                            upperTextContent: countdownViewModel.getRemainingTime(for: .minute), lowerTextContent: "Minutes",
                            fonts: [upperLabelFont, lowerLabelFont], verticalSpacing: -4)
                        MultiLineLabel(
                            upperTextContent: countdownViewModel.getRemainingTime(for: .day), lowerTextContent: "Days",
                            fonts: [upperLabelFont, lowerLabelFont], verticalSpacing: -4)
                        MultiLineLabel(
                            upperTextContent: countdownViewModel.getRemainingTime(for: .month), lowerTextContent: "Months",
                            fonts: [upperLabelFont, lowerLabelFont], verticalSpacing: -4)
                    HStack(alignment: .bottom, spacing: nil, content: {
                        MultiLineLabel(
                            upperTextContent: countdownViewModel.getRemainingTime(for: .year), lowerTextContent: "Years",
                            fonts: [upperLabelFont, lowerLabelFont], verticalSpacing: -4)
                        Spacer()
                        Text("...until the age of 80")
                            .fontWeight(.light)
                            .italic()
                    })
                })
                .padding(24)
            })
            .onReceive(timer, perform: { _ in
                self.countdownViewModel.currentDate = Date()
            })
            .padding(EdgeInsets.init(top: 4, leading: 16, bottom: 16, trailing: 16))
    }
}

struct CountdownView_Preview : PreviewProvider{
    static var previews: some View{
        CountdownView(countdownViewModel: CountdownViewModel(eightyYearsDate: Calendar.current.date(from: DateComponents(year: 2075, month: 8, day: 18))!))
            .frame(width: .infinity, height: 100, alignment: .center)
    }
}
