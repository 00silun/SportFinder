//
//  row_template.swift
//  Setting_template
//
//  Created by Sondre Lyngstad on 31/01/2024.
//

import SwiftUI

struct rowTemplate: View {
    
    let imageName: String
    let title: String
    let description: String
    let tintColor: Color
    
    var body: some View {
        
        VStack(alignment: .leading, spacing:10.0 ){
            
            HStack{
                Image(systemName: imageName)
                    .foregroundColor(tintColor)
                Text(title)
                    .fontWeight(.bold)
                Text(description)
                    //.underline(color: .red)
                    
                
            }
            
            
                
        }
        
    }
}






struct row_template_Previews: PreviewProvider {
    static var previews: some View {
        rowTemplate(imageName: "globe", title: "General", description: "description", tintColor: Color(.systemRed))
    }
}
