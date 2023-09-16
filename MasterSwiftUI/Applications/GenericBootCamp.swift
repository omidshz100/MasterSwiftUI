//
//  GenericBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 03/08/23.
//

import SwiftUI

struct StringModel{
    let info:String?
    func removeInfo()-> StringModel{
        StringModel(info: nil)
    }
}
struct BoolModel{
    let info:Bool?
    func removeInfo()-> BoolModel{
        BoolModel(info: nil)
    }
}
struct GenericModel<CustomType>{
    let info:CustomType?
    func removeInfo()->GenericModel{
        GenericModel(info: nil)
    }
}
// ✅ The fact is that if I use this generic here, this generic type conformed to the View protocol, it means that If I want generic type it must be View protocol.
// Don't forget anything that conforms to View Protocol
struct CustomView<CustomContent:View>:View {
    let content:CustomContent
    let title:String
    var body: some View{
        VStack{
            Text("hello")
            content
        }
    }
}
class GenericsViewModel:ObservableObject{
    @Published var stringModel:StringModel = StringModel(info: "Hello worls!")
    @Published var boolModel:BoolModel = BoolModel(info: true)
    @Published var genericStringModel:GenericModel = GenericModel(info: "Hello worls!")
    @Published var genericBoolModel:GenericModel = GenericModel(info: true)
    func remoteData(){
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}
struct GenericBootCamp: View {
    @StateObject var vm = GenericsViewModel()
    var body: some View {
        VStack{
            // ✅
            CustomView(content: Text("Contetnt for customView"), title: "Hello Inside customView")
            Text(vm.stringModel.info ?? "No Data")
            Text(vm.boolModel.info?.description ?? "No Data")
            
            Text(vm.genericStringModel.info ?? "No Data")
            Text(vm.genericBoolModel.info?.description ?? "No Data")
               
        } .onTapGesture {
            vm.remoteData()
        }
    }
}
struct GenericBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericBootCamp()
    }
}
