//
//  UserInfoView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 02/03/21.
//

import Foundation
import SwiftUI

struct UserInfoView : View {
    
    @State var birthDate : Date = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1))!
    
    @State var firstName : String = ""
    
    var body : some View{
        VStack(alignment: .leading) {
            Text("Something about you...")
                .font(.title)
            
            getFirstNameTextField()
            getDatePicker()
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type")
        }
        .padding(24)
    }
    
    func getDatePicker() -> some View{
        DatePicker(selection: $birthDate,
                   in: ...Date(),
                   displayedComponents: .date,
                   label: {})
            .datePickerStyle(WheelDatePickerStyle())
    }
    
    func getFirstNameTextField() -> some View{
        TextField("Your first name", text: $firstName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
    
}

struct UserInfoView_Preview : PreviewProvider{
    static var previews: some View{
        UserInfoView(birthDate: Date())
    }
}
