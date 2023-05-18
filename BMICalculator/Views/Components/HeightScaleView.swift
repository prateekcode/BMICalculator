//
//  HeightScaleView.swift
//  BMICalculator
//
//  Created by Prateek Rai on 18/05/23.
//

import SwiftUI

struct HeightScaleView: View {
    
    var heightRange: ClosedRange<Double>
    @State private var speed = 50.0
    @State private var isEditing = false
    var onCurrentValueChange: (Int) -> Void = { _ in } // Closure to capture currentValue changes
    
    var body: some View {
        VStack{
            Text("Height")
                .modifier(TitleModifier())
            HStack(spacing: 2){
                Text(String(Int(speed)))
                    .font(.system(size: 42, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                Text("cm")
                    .frame(maxHeight: 36, alignment: .bottom)
                    .foregroundColor(Color.gray)
            }
            Slider(
                value: $speed,
                in: heightRange,
                onEditingChanged: { editing in
                    isEditing = editing
                    onCurrentValueChange(Int(speed))
                }
            )
            .accentColor(.pinkAccent)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.modBlue)
        .cornerRadius(6)
        .shadow(radius: 8, y: 8)
    }
}

struct HeightScaleView_Previews: PreviewProvider {
    static var previews: some View {
        HeightScaleView(heightRange: 0...100)
    }
}
