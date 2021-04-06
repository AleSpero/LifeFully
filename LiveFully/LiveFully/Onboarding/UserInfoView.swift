//
//  UserInfoView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 02/03/21.
//

import Foundation
import SwiftUI

struct UserInfoView : View {
    
    @State var needsToGoForward : Bool = false
    @State var showInfoDialog : Bool = false
    
    @State var birthDate : Date = Calendar.current.date(from: DateComponents(year: 2000, month: 1, day: 1))!
    
    @State var firstName : String = ""
    @State var textValidationFailed = false
    
    var body : some View{
        VStack(alignment: .leading, spacing: 32) {
            Spacer()
            getFirstNameTextField()
            getDatePicker()
            getDataDisclaimer()
            Spacer()
            NavigationLink(destination: AgeGoalView(), isActive: $needsToGoForward){
                getNextButton()
            }.disabled(firstName.isEmpty)
        }
        .padding(24)
        .navigationTitle("Something about you")
        .navigationBarBackButtonHidden(true)
    }
    
    func getDataDisclaimer() -> some View{
        VStack(alignment: .leading, spacing: 16) {
            getDisclaimerTop()
            getDisclaimerBottom()
        }.padding([.leading], 8)
    }

    
    func getNextButton() -> some View{
        return Button(action: {
            LiveFullyDefaults.dateOfBirth = birthDate.timeIntervalSince1970
            LiveFullyDefaults.userName = firstName
            self.needsToGoForward = true
        }, label: {
            HStack{
                Spacer()
                Text("Next")
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
        })
        .disabled(firstName.isEmpty)
        .buttonStyle(FilledButtonStyle())
    }
    
    func getDatePicker() -> some View{
        VStack(alignment: .leading, spacing: 2) {
            Text("I was born on...")
                .italic()
                .font(.callout)
                .foregroundColor(Color("primary"))
            DatePicker(selection: $birthDate,
                       in: getDatePickerRange(),
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
            .onTapGesture {
                self.showInfoDialog = true
            }
            .alert(isPresented: $showInfoDialog, content: {
                Alert(title: Text("About your data"), message: Text("LiveFully needs your date of birth in order to calculate how much time does it take for you to reach your selected age target (30, 50 or 80 years)."), dismissButton: nil)
            })
        }
    }
    
    func getDatePickerRange() -> ClosedRange<Date>{
        let startingDate = Calendar.current.date(from: DateComponents(year: 1940, month: 1, day: 1))!
        return startingDate...Date()
    }
    
    func getFirstNameTextField() -> some View{
        VStack(alignment: .leading, spacing: 4) {
            Text("My First name is...")
                .italic()
                .font(.callout)
                .foregroundColor(textValidationFailed ? .red : Color("primary"))
                .padding([.leading], 4)
            TextField("Your first name", text: $firstName)
                .font(.callout)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(textValidationFailed ? .red : Color("primary"), lineWidth: 2)
            )
        }
        
    }
    
    func getDisclaimerTop() -> some View{
        (Text("This data is ").font(.callout) + Text("stored only on your device").font(.callout).bold() + Text(" and nowhere else."))
            .fixedSize(horizontal: false, vertical: true)

    }
    
    func getDisclaimerBottom() -> some View{
        Text("You can always change it in the settings, and they will be completely removed from your phone when you uninstall the app.")
            .font(.callout)
            .fixedSize(horizontal: false, vertical: true)
    }
    
}

struct UserInfoView_Preview : PreviewProvider{
    static var previews: some View{
        UserInfoView(birthDate: Date())
    }
}
