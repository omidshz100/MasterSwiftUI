//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 19/08/23.
//

import SwiftUI



extension View {
    func onScrollViewOffsetChange(action: @escaping (_ offset:CGFloat)-> Void ) -> some View {
        self.background(
            GeometryReader { geo in
                Text("")
                    //.preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                    .scrollViewValue(geo.frame(in: .global).minY)
            }.onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                action(value)
            }
        )
    }
}
extension View {
    func scrollViewValue(_ v:CGFloat) -> some View{
        preference(key: ScrollViewOffsetPreferenceKey.self, value: v)
    }
}
struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    @State var scrollOffset:CGFloat = 0
    @State var frameView:CGRect = CGRect.zero
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Navigation Title")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .opacity(scrollOffset / 47.000)
                    .onScrollViewOffsetChange { offset in
                        self.scrollOffset = offset
                    }
                
                ForEach(0..<30){ _ in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink)
                        .frame(width: 370, height: 200)
                }
            }
        }
        .overlay(alignment: .top, content: {
            Text("\(scrollOffset)")
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.5))
                .opacity(scrollOffset < (47 / 2) ? 1.0:0.0)
            
        })
        
    }
}

struct ScrollViewOffsetPreferenceKey:PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyBootcamp()
    }
}
