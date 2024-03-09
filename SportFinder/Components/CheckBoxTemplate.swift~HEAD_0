//
//  CheckBoxView.swift
//  SportFinder
//
//  Created by Simon Lundgren on 26/02/2024.
//

import SwiftUI

struct checkBoxTemplate: View {
    @State var checked: Bool
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.checked.toggle()
            self.action()
        }) {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(checked ? .blue : .gray)
                .imageScale(.large)
        }
    }
}
import SwiftUI


struct BasicCheckbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .foregroundColor(isChecked ? .blue : .black)
        }
    }
}


struct CheckboxWithText: View {
    var title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            BasicCheckbox(isChecked: $isChecked)
            Text(title)
        }
    }
}


struct CheckboxWithCustomLabel: View {
    var title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .foregroundColor(isChecked ? .blue : .black)
            }
            Text(title)
        }
    }
}


struct CustomStyledCheckbox: View {
    var title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isChecked ? .blue : .black)
                .onTapGesture {
                    isChecked.toggle()
                }
            Text(title)
                .foregroundColor(.black)
        }
    }
}


struct CircleCheckbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "largecircle.fill.circle" : "circle")
                .foregroundColor(isChecked ? .blue : .black)
        }
    }
}


struct CustomShapeCheckbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isChecked ? .blue : .black)
                .clipShape(Capsule()) // Use any custom shape here
        }
    }
}



struct WavyLineCheckbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            ZStack {
                WavyLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                    .frame(width: 24, height: 24)
                if isChecked {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .bold))
                }
            }
        }
    }
}

struct WavyLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define the wavy line shape
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addCurve(to: CGPoint(x: rect.maxX * 0.25, y: rect.midY),
                      control1: CGPoint(x: rect.minX + rect.width * 0.05, y: rect.minY),
                      control2: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.maxX * 0.75, y: rect.midY),
                      control1: CGPoint(x: rect.midX, y: rect.maxY),
                      control2: CGPoint(x: rect.midX, y: rect.minY))
        path.addCurve(to: CGPoint(x: rect.maxX * 1.0, y: rect.midY),
                      control1: CGPoint(x: rect.maxX - rect.width * 0.25, y: rect.minY),
                      control2: CGPoint(x: rect.maxX - rect.width * 0.05, y: rect.maxY))
        
        return path
    }
}




struct RoundedRectangleCheckbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            RoundedRectangle(cornerRadius: 8)
                .stroke(isChecked ? Color.blue : Color.black, lineWidth: 2)
                .frame(width: 24, height: 24)
        }
    }
}

/*
 Rectangle: Rectangle()
 Rounded Rectangle: RoundedRectangle(cornerRadius: CGFloat)
 Circle: Circle()
 Ellipse: Ellipse()
 Capsule: Capsule()
 Triangle: You can create a triangle using Path and its drawing methods.
 Star: A star shape can be created using a Path with appropriate drawing commands.
 Arc: You can create an arc shape using Path with arc drawing commands.
 Line: You can create a line shape using Path with line drawing commands.
 Regular Polygon: A regular polygon shape can be created using a Path with appropriate drawing commands.
 Heart: A heart shape can be created using a Path with appropriate drawing commands.
 Spiral: A spiral shape can be created using a Path with appropriate drawing commands.
 QuadCurve: A quadratic Bézier curve can be created using Path with quad curve drawing commands.
 CubicCurve: A cubic Bézier curve can be created using Path with cubic curve drawing commands.
 Octagon: An octagon shape can be created using Path with appropriate drawing commands.
 Hexagon: A hexagon shape can be created using Path with appropriate drawing commands.
 Diamond: A diamond shape can be created using Path with appropriate drawing commands.
 Parallelogram: A parallelogram shape can be created using Path with appropriate drawing commands.
 WavyLine: A wavy line shape can be created using Path with appropriate drawing commands.
 BezierPath: You can create a custom shape using Path with any combination of drawing commands.
 */

struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        VStack {
            // Basic Checkbox
            BasicCheckbox(isChecked: .constant(true))
            BasicCheckbox(isChecked: .constant(false))
                .padding(.bottom, 10)
            
            // Checkbox with Text
            CheckboxWithText(title: "Option 1", isChecked: .constant(true))
            CheckboxWithText(title: "Option 2", isChecked: .constant(false))
                .padding(.bottom, 10)
            
            // Checkbox with Custom Label
            CheckboxWithCustomLabel(title: "Option A", isChecked: .constant(true))
            CheckboxWithCustomLabel(title: "Option B", isChecked: .constant(false))
                .padding(.bottom, 10)
            
            // Custom Styled Checkbox
            CustomStyledCheckbox(title: "Choice 1", isChecked: .constant(true))
            CustomStyledCheckbox(title: "Choice 2", isChecked: .constant(false))
                .padding(.bottom, 10)
            
            // Circle Checkbox
            CircleCheckbox(isChecked: .constant(true))
            CircleCheckbox(isChecked: .constant(false))
                .padding(.bottom, 10)
            
            // Rounded Rectangle Checkbox
            RoundedRectangleCheckbox(isChecked: .constant(true))
            RoundedRectangleCheckbox(isChecked: .constant(false))
                .padding(.bottom, 10)
            
            // Custom Shape Checkbox
            CustomShapeCheckbox(isChecked: .constant(true))
            CustomShapeCheckbox(isChecked: .constant(false))
                .padding(.bottom, 10)
            
            
            //WavyLine Checkbox
            WavyLineCheckbox(isChecked: .constant(true))
            WavyLineCheckbox(isChecked: .constant(false))
                .padding(.bottom, 10)
            
            
        }
        .padding()
    }
}



#Preview {
    checkBoxTemplate(checked: false, action: {})
}
