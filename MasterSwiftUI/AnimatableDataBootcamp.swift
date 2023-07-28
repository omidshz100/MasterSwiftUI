//
//  AnimatableDataBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 28/07/23.
//

import SwiftUI

struct AnimatableDataBootcamp: View {
    @State var animate:Bool = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: animate ? 30:0)
                .frame(width: 200, height: 200)
        }
        .onAppear(){
                withAnimation(Animation.linear(duration: 1.2).repeatForever()){
                    animate.toggle()
                }
            }
    }
}

struct AnimatableDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableDataBootcamp()
    }
}
