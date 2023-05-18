//
//  ButtonView.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI
 
struct ButtonLabelView: View {
    
    var buttonTitleText: String
    
    var body: some View {
        Text(buttonTitleText.uppercased())
            .modifier(CustomButtonViewModifier())
    }
}

struct CustomButtonViewModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.pinkAccent)
            .cornerRadius(8)
    }
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabelView(buttonTitleText: "Tap Me")
    }
}
