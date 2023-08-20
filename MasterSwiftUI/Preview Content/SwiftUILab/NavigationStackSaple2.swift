//
//  NavigationStackSaple2.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 14/08/23.
//

import SwiftUI

struct NavigationStackSaple2: View {
    
    @State var path:[FoodsName] = []
    var body: some View {
        NavigationStack(path: $path){
            RootView()
                .navigationDestination(for: FoodsName.self, destination: { value in
                    DestinationView(foodName: value){
                        NavigationLink("\(value.rawValue) Click me to add another ! ", value: value)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                backToRoot()
                            } label: {
                                Text("Press me! \(path.count == 0 ? path.count + 1 : path.count)")
                            }
                        }
                    }
                })
        }
    }
    
    func backToRoot(){
        path.removeAll()
    }
}


enum FoodsName:String, Hashable, CaseIterable{
    case Pasta = "Pasta"
    case Pizza = "Pizza"
    case Chease = "Chease"
    case FrenchPotato = "FrenchPotato"
}
struct RootView:View {
    var body: some View {
        List(FoodsName.allCases, id: \.self){ item in
            NavigationLink(item.rawValue , value: item)
        }
    }
}

struct DestinationView<Content:View>:View {
    let content:Content?
    var foodName:FoodsName
    
    init(foodName:FoodsName ,@ViewBuilder content: ()-> Content = {EmptyView()}) {
        self.content = content()
        self.foodName = foodName
    }
    var body: some View{
        VStack{
            Text(foodName.rawValue)
                .bold()
            content
        }
    }
}
struct NavigationStackSaple2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackSaple2()
    }
}
