//
//  CountdownViewModel.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 18/02/21.
//

import Foundation

class CountdownViewModel : ObservableObject{
    
    @Published var currentDate : Date = Date()
    let targetDate : Date
    
    init(targetDate : Date) {
        self.targetDate = targetDate
    }
        
    func getRemainingTime(for component: Calendar.Component) -> String{
        let interval = Calendar.current.intervalBetweenDates(for: component, from: currentDate, to: targetDate)
        let rawIntegerInterval = interval.value(for: component) ?? 0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: rawIntegerInterval)) ?? "0"
    }
    
}

extension Calendar{
    func intervalBetweenDates(for component: Calendar.Component, from startingDate: Date, to endDate: Date) -> DateComponents{
        return dateComponents([component], from: startingDate, to: endDate)
    }
}
