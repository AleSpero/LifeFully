//
//  LiveFullyDefaults.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 04/03/21.
//

import Foundation

struct LiveFullyDefaults{
    
    static let appGroup = "live_fully"
    static let instance : UserDefaults = initLiveFullyDefaults()
    
    private static func initLiveFullyDefaults() -> UserDefaults{
        guard let defaults = UserDefaults(suiteName: appGroup) else { return UserDefaults() }
        return defaults
    }
    
    static var userName : String? {
        get{
            nil
            //"Alessandro"
            // enable this:LiveFullyDefaults.instance.string(forKey: DefaultsKeys.userName.rawValue)
        }
        set(value){
            LiveFullyDefaults.instance.set(value, forKey: DefaultsKeys.userName.rawValue)
        }
    }
    
    static var dateOfBirth : Double {
        get{
            808696800
            //LiveFullyDefaults.instance.double(forKey: DefaultsKeys.dateOfBirth.rawValue)
        }
        set(value){
            LiveFullyDefaults.instance.set(value, forKey: DefaultsKeys.dateOfBirth.rawValue)
        }
    }
    
    static var ageGoal : Int {
        get{
            80
            //LiveFullyDefaults.instance.integer(forKey: DefaultsKeys.ageGoal.rawValue)
        }
        set(value){
            LiveFullyDefaults.instance.set(value, forKey: DefaultsKeys.ageGoal.rawValue)
        }
    }
    
    static var targetDate : Date?{
        get{
            guard ageGoal > 0 else { return nil }
            let birthDate = Date(timeIntervalSince1970: dateOfBirth)
            return Calendar.current.date(byAdding: DateComponents(year: ageGoal), to: birthDate)
        }
    }
}

enum DefaultsKeys : String{
    case userName = "user_name"
    case dateOfBirth = "date_of_birth"
    case ageGoal = "age_goal"
}
