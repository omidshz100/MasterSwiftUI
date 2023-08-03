//
//  AnimatableDataBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 28/07/23.
//

import SwiftUI
//✅ 😂

struct AnimatableDataBootcamp: View {
    @State var animate:Bool = false
    var body: some View {
        VStack{
            
            PacMan(offsetAmount: animate ? 20:0)
                .frame(width: 100, height: 100)
            ZStack{
                RoundedRectangle(cornerRadius: animate ? 100:0)
                    .frame(width: 200, height: 200)
            }
            .onAppear(){
                    withAnimation(Animation.linear(duration: 1.2).repeatForever()){
                        animate.toggle()
                    }
                }
            RectangleWithSingleCornerRadiuos(cornerRadius: animate ? 60:0)
                .frame(width: 300, height: 300)
        }
    }
}

struct RectangleWithSingleCornerRadiuos:Shape{
    var cornerRadius:CGFloat
    var animatableData: CGFloat {
        get { cornerRadius}
        set { cornerRadius = newValue }
    }
    func path(in rect: CGRect) -> Path {
        
        Path{ path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius , y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            
        }
    }
}
struct PacMan:Shape{
    
    var offsetAmount:Double
    var animatableData: Double {
        get{ offsetAmount}
        set{ offsetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        Path{ path in
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                        radius: rect.height / 2 ,
                        startAngle: Angle(degrees: offsetAmount),
                        endAngle: Angle(degrees: 360 - offsetAmount ),
                        clockwise: false)
        }
    }
}

struct AnimatableDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableDataBootcamp()
    }
}
