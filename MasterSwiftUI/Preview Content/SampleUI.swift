//
//  SampleUI.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 20/09/23.
//

import SwiftUI

struct SampleUI: View {
    
    @State var selected:Int =  0
    var body: some View {
        CustomViewSample(selected: $selected){
            Text("Txt1 ")
            Text("Txt2 ")
            Text("Txt3 ")
        }
    }
}

struct CustomViewSample<Content>:View where Content: View {
    var content: Content
    @Binding var selected:Int
    
    
    init(selected:Binding<Int>, @ViewBuilder content: ()-> Content) {
        self._selected = selected
        self.content = content()
    }
    
    
    
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                content
            }
            Spacer()
            HStack{
                Spacer()
                Button("back") {
                    selected -= 1
                    print(selected)
                }
                Spacer()
                Button("next") {
                    selected += 1
                    print(selected)
                }
                Spacer()
            }
            Spacer()
        }
    }
}


func myView()-> some View {
    return Text("Txt from function")
}



struct SampleUI_Previews: PreviewProvider {
    static var previews: some View {
        SampleUI()
    }
}
