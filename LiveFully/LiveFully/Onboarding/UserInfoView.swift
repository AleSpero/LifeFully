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
        VStack(alignment: .leading, spacing: 32) {
            Text("Something about you...")
                .font(.title)
                .bold()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
            
            getFirstNameTextField()
            getDatePicker()
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type")

        }
        .padding(24)
    }
    
    func getDatePicker() -> some View{
        VStack(alignment: .leading, spacing: 2) {
            Text("I was born on...")
                .italic()
                .font(.subheadline)
                .foregroundColor(Color("primary"))
            DatePicker(selection: $birthDate,
                       in: ...Date(),
                       displayedComponents: .date,
                       label: {})
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .frame(maxWidth: .infinity)
            HStack{
                Spacer()
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 12, height: 12, alignment: .center)
                    .foregroundColor(Color("primary"))
                Text("Why are you asking me this?")
                    .font(.caption)
                    .foregroundColor(Color("primary"))
                    .underline()
                    .padding(EdgeInsets.init(top: 0, leading: -5, bottom: 0, trailing: -5))
            }.padding(EdgeInsets(top: -12, leading: 0, bottom: 0, trailing: 0))
        }
    }
    
    func getFirstNameTextField() -> some View{
        VStack(alignment: .leading, spacing: 4) {
            Text("My First name is...")
                .italic()
                .font(.subheadline)
                .foregroundColor(Color("primary"))
                .padding([.leading], 8)
            TextField("Your first name", text: $firstName)
                .font(.callout)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(Color("primary"), lineWidth: 2)
            )
        }
        
    }
    
}

struct UserInfoView_Preview : PreviewProvider{
    static var previews: some View{
        UserInfoView(birthDate: Date())
    }
}
