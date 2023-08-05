//
//  ViewBuilderBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 05/08/23.
//

import SwiftUI

struct HeaderViewRegular:View{
    let title:String
    let description:String?
    let iconeName:String?
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let descriptiom = description{
                Text(descriptiom)
                    .font(.callout)
            }
            if let iconeName = iconeName {
                Image(systemName: iconeName)
            }
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
// One CustomView
struct GenericHeaderView<Content:View>:View{
    let title:String
    let content:Content
    init(title: String,@ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View{
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            content
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
// Second CustomView
struct CustomHStack<Content:View>:View{
    let content:Content
    
    init(@ViewBuilder content: ()-> Content) {
        self.content = content()
    }
    
    var body: some View{
        HStack{
            content
        }
    }
}

@ViewBuilder
func SomeView()-> some View {
    Text("sdjkhfb")
}

// First MainView
struct ViewBuilderBootCamp: View {
    var body: some View {
        VStack{
            
            HeaderViewRegular(title: "New Title", description: "hello world! ", iconeName: "heart.fill")
            HeaderViewRegular(title: "New Title", description: nil, iconeName: nil)
            GenericHeaderView(title: "Hello"){
                Text("Some text here klasnd")
            }
            
            CustomHStack{
                Text("Something here")
                Text("Something here")
            }
            HStack{
                Text("Something here")
                Text("Something here")
            }
            Spacer()
        }
    }
}
// Second MainView
struct LocalViewBuilder:View{
    enum ViewType{
        case one, two, three
    }
    let type:ViewType
    var body: some View{
        headerSection
    }
    // ✅ Magic tip is here 😂
    // if you don't use @viewBuilder you will have tons of errors
    // so it's good Idea to use it if not you can add extra Hstack
    // but better to Use @viewBuilder
    @ViewBuilder
    private var headerSection: some View {
        // ⚠️ it's recommended to use switch case than if here
        if type == .one {
            viewOne
        }else if type == .two{
            viewTwo
        }else if type == .three {
            viewThree
        }
    }
    private var viewOne: some View {
        Text("View One")
    }
    private var viewTwo: some View {
        VStack{
            HStack{
                Image(systemName: "heart.fill")
                Text("ViewTwo title")
            }
                .font(.title)
            Text("Some Descriptions")
        }
    }
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}
struct ViewBuilderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalViewBuilder(type: .one)
    }
}
