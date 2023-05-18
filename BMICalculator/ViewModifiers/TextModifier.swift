//
//  TextModifier.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct TitleModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content.textCase(.uppercase)
            .font(.headline)
            .foregroundColor(Color.gray)
    }
}


struct ValueModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        
    }
}
