//
//  DetailView.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var userInput: UserInput
    var bmiResult: BMIResult {
         let bmi = calculateBMI()
         if bmi < 18.5 {
             return .underweight
         } else if bmi < 25.0 {
             return .normal
         } else if bmi < 30.0 {
             return .overweight
         } else {
             return .obesity
         }
     }
    
    var body: some View {
        ZStack{
            Color.darkBlue.ignoresSafeArea()
            VStack{
                Text("Your Result")
                    .font(.system(size: 32, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack{
                    Text(bmiResult.label)
                        .textCase(.uppercase)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(bmiResult.getColor())
                        .padding(.top, 48)
                    Text("\(calculateBMI(), specifier: "%.2f")")
                        .font(.system(size: 72, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top)
                    Text("Normal BMI range:")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.top, 2)
                    
                    Text("18.5 - 24.9")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(bmiResult.getMessage())
                        .font(.title2)
                        .fontDesign(.rounded)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .padding(.top, 16)
                        .padding(.bottom, 48)
                }
                .frame(maxWidth: .infinity)
                .background(Color.lightBlue)
                .cornerRadius(8)
                .padding()
                .shadow(radius: 12)
                
                // Recalculate Button View
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    ButtonLabelView(buttonTitleText: "Recalculate Your BMI")
                }
                .padding()

            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func calculateBMI()-> Float{
        let weight = userInput.weight
        let height = userInput.height / 100
        let bmi = weight/(height * height)
        return bmi
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(userInput: UserInput(gender: .Male, height: 12, weight: 43, age: 23))
    }
}

enum BMIResult {
    case underweight
    case normal
    case overweight
    case obesity

    
    var label: String {
        switch self {
        case .underweight:
            return "Underweight"
        case .normal:
            return "Normal"
        case .overweight:
            return "Overweight"
        case .obesity:
            return "Obesity"
        }
    }
    
    func getRange() -> String{
        switch self {
        case .underweight:
            return "Less than 18.5"
        case .normal:
            return "18.5 - 24.9"
        case .overweight:
            return "25.0 - 29.9"
        case .obesity:
            return "30.0 and above"
        }
    }
    
    func getColor() -> Color{
        switch self {
        case .underweight, .obesity:
            return .red
        case .normal:
            return .green
        case .overweight:
            return .yellow
        }
    }
    
    func getMessage() -> String {
        switch self {
        case .underweight:
            return "You are underweight. It's important to maintain a healthy weight. Consider consulting a healthcare professional."
        case .normal:
            return "You have a normal body weight. Good job!"
        case .overweight:
            return "You are overweight. It's recommended to make lifestyle changes to achieve a healthy weight. Consider consulting a healthcare professional."
        case .obesity:
            return "You have obesity. It's crucial to take steps to manage your weight for overall health. Consider consulting a healthcare professional."
        }
    }

}
