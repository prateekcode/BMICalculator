//
//  SexToggleButton.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct SexToggleButton: View {
    
    var sex: Sex
    var isPressed: Bool
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 8){
            Image(sex.configType().0)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 80)
            Text(sex.configType().1.uppercased())
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

enum Sex {
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

struct SexToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        SexToggleButton(sex: Sex.Female, isPressed: .random(), action: {
            print("Do something")
        })
    }
}
