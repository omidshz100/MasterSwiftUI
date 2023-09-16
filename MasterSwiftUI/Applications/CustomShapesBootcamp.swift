//
//  CustomShapesBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 26/07/23.
//

import SwiftUI


struct Triangle:Shape{
    
    
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.midX , y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX , y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX , y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX , y: rect.midY))
        }
    }
}
struct CustomShapesBootcamp: View {
    @State var amountFrom:CGFloat = 0
    @State var amountTo:CGFloat = 0.5
    var body: some View {
        VStack{
            ZStack{
                Image("swiftui")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Triangle().stroke(style: StrokeStyle(lineWidth: amountFrom, lineCap: .round, dash: [amountTo])))
                
            }
            Triangle()
                //.trim(from: amountFrom, to: amountTo)
                 .stroke(style: StrokeStyle(lineWidth: amountFrom, lineCap: .round, dash: [amountTo]))
                .frame(width: 300, height: 300)
            
            Slider(value: $amountFrom, in: 0...10)
            Slider(value: $amountTo, in: 0...20)
        }
    }
}

struct CustomShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBootcamp()
    }
}
