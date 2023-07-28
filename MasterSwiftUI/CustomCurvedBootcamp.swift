//
//  ustomCurvedBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 28/07/23.
//

import SwiftUI



struct CustomCurvedBootcamp: View {
    var body: some View {
        VStack{
            ZStack{
                CurvedShape()
                    .frame(width: 300, height: 300)
            }
            
            ZStack{
                CurvedView()
                    .fill(
                        LinearGradient(colors: [Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))], startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: .infinity, height: .infinity)
                    
            }
        }
        .frame(height: .infinity)
        .ignoresSafeArea()
    }
}

struct CurvedShape:Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: .zero))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            path.addArc(center: CGPoint(x: rect.midX, y:rect.midY), radius: rect.height / 2.0  , startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
            path.addLine(to: .zero)
        }
    }
}

struct CurvedView:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ path in
            
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.25))
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.75))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
}
struct CustomCurvedBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurvedBootcamp()
    }
}
