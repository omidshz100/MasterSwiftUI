//
//  AnyTransitionBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 15/07/23.
//

import SwiftUI

// ✅ Transiition
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
// ✅ Transiition
extension AnyTransition {
    // ✅ Transiition
    static var rotation:AnyTransition {
        // identity :‌معنی اینو میده که هویت اصلیش چی بوده
        // انگاری انیمیشن از مقدار مقصد به مقدار واقعی خودش بر میگرده
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 1080),
            identity: RotateViewModifier(rotation: 0))
    }
    // ✅ Transiition
    static func rotating(rotation:Double)-> AnyTransition {
        return AnyTransition.modifier(active: RotateViewModifier(rotation: rotation), identity: RotateViewModifier(rotation: 0))
        }
    // ✅ Transiition
    static var rotateOn:AnyTransition {
        return AnyTransition.asymmetric(insertion: .rotation, removal: .move(edge: .leading))
    }
}
struct AnyTransitionBootcamp: View {
    @State var isShowingRectangle:Bool = true
    let lGColor = LinearGradient(stops: [Gradient.Stop(color: .white, location: 0.0),Gradient.Stop(color: .green, location: 0.2),Gradient.Stop(color: .blue, location: 0.8),Gradient.Stop(color: .black, location: 1.0)],startPoint: UnitPoint(x: 0.00, y: 0.00),endPoint: UnitPoint(x:1.00, y: 1.00))
    var body: some View {
        VStack{
            Spacer()
            if isShowingRectangle{
                RoundedRectangle(cornerRadius: 25)
                    .fill(lGColor)
                    .frame(width: 250, height: 360)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                // ✅ Transiition
                // transtion ها
                // بطور پیشفرض همیشه مقدار دهی شدن و لازم نیست همیشه مقدار دهی بشن
                    //.transition(.move(edge: .trailing))
                // اگه توی کتاب مرجع جست و جو کنی موارد بیشتری هم پیدا میکنی
                // در اینجا من یک
                // transition
                // سفارشی خودم را درست کردم و زمانی که قراره انیمیشن اتفاث بی افته اجرا میشه
                //  اوم زمان کیه؟؟
                // زمانی که keyframe ها
                // در حالت تغییر مقدار فعال میشن
                    //.transition(.rotating(rotation:180))
                    .transition(.rotateOn)// ✅ Transiition
            }
            Spacer()
            Text("Click me!")
                .withDefaultButtonViewModifier()
                .padding(.horizontal, 25)
                .onTapGesture {
                    // ✅ Transiition
                    withAnimation(.easeInOut(duration: 0.5) ){
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
