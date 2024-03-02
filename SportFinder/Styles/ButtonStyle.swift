//
//  CustomStyles.swift
//  Setting_template
//
//  Created by Sondre Lyngstad on 03/02/2024.
//

import SwiftUI
import Foundation


struct customButtonStyle: ButtonStyle {
   
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color(.systemPink))
            .foregroundColor(.white)
            .font(.headline)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 1)
            ).frame(maxWidth: .infinity, alignment: .bottom)
    }
}



