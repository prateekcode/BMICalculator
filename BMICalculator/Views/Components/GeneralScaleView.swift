//
//  WeightScaleView.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct GeneralScaleView: View {
     
    var scaleType: ScaleType
    @State private var currentValue: Int = 13
    let minValue: Int = 1
    let maxValue: Int = 100
    var onCurrentValueChange: (Int) -> Void = { _ in } // Closure to capture currentValue changes
    
    var body: some View {
        VStack(alignment : .center){
            Text(scaleType.scaleLabel())
                .modifier(TitleModifier())
            Text(String(currentValue))
                .font(.system(size: 42, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            HStack{
                OperationButtonView(buttonType: .Minus){
                    if currentValue > minValue {
                        currentValue -= 1
                        onCurrentValueChange(currentValue)
                    }
                }
                OperationButtonView(buttonType: .Plus){
                    if currentValue < maxValue{
                        currentValue += 1
                        onCurrentValueChange(currentValue)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.modBlue)
        .cornerRadius(6)
        .shadow(radius: 8, y: 8)
    }

    mutating func currentValueListener(_ listener: @escaping (Int) -> Void) {
        onCurrentValueChange = listener
    }
}

enum ScaleType{
    case Age
    case Weight
    
    func scaleLabel() -> String{
        switch self {
        case .Age:
            return "Age"
        case .Weight:
            return "Weight"
        }
    }
}

struct GeneralScaleViw_Previews: PreviewProvider {
    static var previews: some View {
        GeneralScaleView(scaleType: ScaleType.Age){ _ in
            print("Current Val")
        }
    }
}

struct OperationButtonView: View{
    
    var buttonType: OperationButtonType
    var onTap: (() -> Void)? = nil
    @State var isPressed = false
    
    var body: some View{
        Image(systemName: buttonType.iconName())
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.lightBlue)
            .clipShape(Circle())
            .scaleEffect(isPressed ? 1.0 : 0.9)
            .onTapGesture {
                withAnimation(.spring()) {
                    isPressed.toggle()
                }
                onTap!()
            }
            .shadow(radius: 8)
            
    }
}


enum OperationButtonType{
    case Plus
    case Minus
    
    func iconName() -> String{
        switch self {
        case .Plus:
            return "plus"
        case .Minus:
            return  "minus"
        }
    }
}
