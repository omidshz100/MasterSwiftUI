//
//  AnyTransitionBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 15/07/23.
//

import SwiftUI


struct RotateViewModifier:ViewModifier {
    
    let rotation:Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x:  rotation != 0 ? UIScreen.main.bounds.width:0,
                y:  rotation != 0 ? UIScreen.main.bounds.height:0)
    }
}
extension AnyTransition {
    static var rotation:AnyTransition {
       return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180),
            identity: RotateViewModifier(rotation: 0))
    }
}
struct AnyTransitionBootcamp: View {
    @State var isShowingRectangle:Bool = false
    let lGColor = LinearGradient(stops: [Gradient.Stop(color: .white, location: 0.0),Gradient.Stop(color: .green, location: 0.2),Gradient.Stop(color: .blue, location: 0.8),Gradient.Stop(color: .black, location: 1.0)],startPoint: UnitPoint(x: 0.00, y: 0.00),endPoint: UnitPoint(x:1.00, y: 1.00))
    var body: some View {
        VStack{
            Spacer()
            if isShowingRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .fill(lGColor)
                    .frame(width: 250, height: 360)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    //.transition(.move(edge: .trailing))
                // اینجا زماندهی که میکنیم باید زیر ۱ باشه چون بیشتر باشه
                // زمانبندی انواع حرکت های انیمیشن به هم میخوره و حرکت درستی ارايه نخواهد شد
                    .transition(AnyTransition.rotation.animation(.easeInOut(duration: 0.35)))
            }
            Spacer()
            Text("Click me!")
                .withDefaultButtonViewModifier()
                .padding(.horizontal, 25)
                .onTapGesture {
                    withAnimation(.easeInOut ){
                        isShowingRectangle.toggle()
                    }
                }
        }
    }
}
struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
