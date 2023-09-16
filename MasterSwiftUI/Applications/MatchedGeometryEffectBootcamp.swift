//
//  MatchedGeometryEffectBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 24/07/23.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State var isChanged:Bool = false
    @Namespace private var namespace
    
    
    var body: some View {
        VStack{
            if !isChanged {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
                    //.offset(y: isChanged ? UIScreen.main.bounds.height * 0.75 : 0 )
                    
            }
            Spacer()
            if isChanged {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 300)
                    //.offset(y: isChanged ? UIScreen.main.bounds.height * 0.75 : 0 )
                    
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
        .onTapGesture {
            withAnimation(.easeOut(duration: 0.5)){
                self.isChanged.toggle()
            }
        }
        
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectBootcamp()
    }
}


// ✅ - matchedGeometryEffect ✅
struct MatchedGeometryEffectExample2:View {
    let  categories:[String] = ["Home", "popular", "Saved"]
    @State var selectedCategory:String = ""
    @Namespace var namspace2
    
    var body: some View {
        HStack{
            ForEach(categories, id: \.self) { category in
                ZStack {
                    if selectedCategory == category {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.orange)
                            .matchedGeometryEffect(id: "category_background", in: namspace2)
                            .frame(width: 35, height: 2)
                            .offset(y:15)
                    }
                    Text(category)
                        .foregroundColor(selectedCategory == category ? Color.orange:Color.black )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()){
                        selectedCategory = category
                    }
                }
            }
        }
        .padding()
    }
}
