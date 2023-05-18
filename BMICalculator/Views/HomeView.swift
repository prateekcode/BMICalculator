//
//  HomeView.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var isButtonTapped: Bool = false
    @State var selectedAge: Int = 13
    @State var selectedWeight: Int = 13
    @State var selectedHeight: Int = 50
    @State var selectedGender: Gender? = .Male
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.darkBlue.ignoresSafeArea()
                VStack{
                    // Header View
                    Text("BMI Calculator")
                        .font(.system(size: 24, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.vertical, 36)
                        .frame(maxWidth: .infinity)
                        .shadow(color: .black, radius: 12)
                   
                    Spacer()
                    
                    // Sex toggle view
                    HStack{
                        GenderToggleButton(gender: .Male, isPressed: selectedGender == .Male){
                            selectedGender = .Male
                        }
                        GenderToggleButton(gender: .Female, isPressed: selectedGender == .Female){
                            selectedGender = .Female
                        }
                    }
                    
                    // Height Slider View
                    HeightScaleView(heightRange: 50...600){ currentValue in
                        selectedHeight = currentValue
                    }
                    
                    HStack{
                        // Weight Increment View
                        GeneralScaleView(scaleType: .Weight){ currentValue in
                            selectedWeight = currentValue
                        }
                    
                        // Age Increment View
                        GeneralScaleView(scaleType: .Age){ currentValue in
                            selectedAge = currentValue
                        }
                    }
                    
                    Spacer(minLength: 64)
                    
                    // Calculate BMI Button View
                    NavigationLink(destination: {
                        DetailView(userInput: UserInput(gender: selectedGender ?? .Male, height: Float(selectedHeight), weight: Float(selectedWeight), age: selectedAge))
                    }, label: {
                        ButtonLabelView(buttonTitleText: "Calculate Your BMI")
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct UserInput{
    var gender: Gender
    var height: Float
    var weight: Float
    var age: Int
}
