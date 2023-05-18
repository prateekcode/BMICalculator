//
//  SexToggleButton.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct GenderToggleButton: View {
    
    var gender: Gender
    var isPressed: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 8){
            Image(gender.configType().0)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 80)
            Text(gender.configType().1.uppercased())
                .font(.title3)
                .bold()
                .fontDesign(.rounded)
        }
        .frame(maxWidth: .infinity, maxHeight: 140)
        .foregroundColor(isPressed ? .white : .gray)
        .background(Color.lightBlue)
        .cornerRadius(6)
        .shadow(radius: 8, y: 8)
        .onTapGesture {
            withAnimation(.default){
                action()
            }
        }
    }
}

enum Gender {
    case Male
    case Female
    
    func configType() -> (String, String){
        switch self {
        case .Male:
            return ("maleIcon", "Male")
        case .Female:
            return ("femaleIcon", "Female")
        }
    }
}

struct GenderToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        GenderToggleButton(gender: Gender.Female, isPressed: .random(), action: {
            print("Do something")
        })
    }
}
