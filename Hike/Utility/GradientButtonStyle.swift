//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Andrew Kestler on 12/11/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //Conditional statement with Nil Coalescing
                //Condition ? A : B
                configuration.isPressed ?
                //A: When button is pressed
                //B: When button is NOT pressed
                
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom) : LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            
            )
            .cornerRadius(40)
    }
}
