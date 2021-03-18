//
//  AgeGoalView.swift
//  LiveFully
//
//  Created by Alessandro Sperotti on 04/03/21.
//

import Foundation
import SwiftUI

struct AgeGoalView : View {
    
    var possibleAgeGoals : [Int] = [30, 50, 80]
    @State var currentlySelected = -1
    
    var body : some View{
        VStack(spacing: 32){
            Text("text, blablabla")
            ageGoalSelectionView()
            Spacer()
            NavigationLink(destination: HomeView()){
                getNextButton()
            }
        }
        .padding(24)
        .navigationTitle("Your Age Goal")
        .navigationBarBackButtonHidden(true)
        
    }
    
    func ageGoalSelectionView() -> some View{
        return VStack(alignment: .leading, spacing: 8){
            Text("Set a countdown until...")
                .italic()
                .foregroundColor(Color("primary"))
            ForEach(possibleAgeGoals, id: \.self) { ageGoal in
                AgeCard(age: ageGoal,
                        isSelected: currentlySelected != -1 && possibleAgeGoals[currentlySelected] == ageGoal)
                    .frame(maxHeight: 80)
                    .onTapGesture {
                        self.currentlySelected = possibleAgeGoals.lastIndex(of: ageGoal) ?? -1
                    }
            }
        }
    }
    
    func getNextButton() -> some View{
        return ActionButton(text: "Next",
                            style: ActionButtonStyle(
                                backgroundColor: Color("primary"),
                                borderColor: Color("primary"),
                                textColor: .white,
                                cornerRadius: 10,
                                icon: AnyView(Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .padding(4)
                                ),
                                iconGravity: .textEnd
                            ), status: currentlySelected != -1 ? ActionButtonStatus.enabled : ActionButtonStatus.disabled,
                            action: {
                //let's goooo
        })
    }
}

struct AgeGoalView_Preview : PreviewProvider{
    static var previews: some View{
        AgeGoalView()
    }
}
