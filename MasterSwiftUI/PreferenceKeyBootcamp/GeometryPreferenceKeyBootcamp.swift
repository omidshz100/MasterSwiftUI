//
//  GeometryPreferenceKeyBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 19/08/23.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State var sizeOfRectangle:CGSize = .zero
    
    
    var body: some View {
        VStack{
            Text("Hello, World!")
                .frame(width: sizeOfRectangle.width, height: sizeOfRectangle.height)
                .background(Color.cyan)
            Spacer()
            HStack{
                Rectangle()
                GeometryReader {geo in
                    Rectangle()
                        .preference(key: CustomPreferenceForGeomeryReader.self ,value: geo.size)
                }
                Rectangle()
            }.frame(height: 55)
        }
        .onPreferenceChange(CustomPreferenceForGeomeryReader.self, perform: { value  in
            self.sizeOfRectangle = value
        })
    }
}

struct CustomPreferenceForGeomeryReader:PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootcamp()
    }
}
