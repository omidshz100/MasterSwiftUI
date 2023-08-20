//
//  PreferenceKeyBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 10/08/23.
//

import SwiftUI

struct PreferenceKeyBootCamp: View {
    
    @State private var text:String = "Hello, world!"
    
    
    var body: some View {
        NavigationView{
            VStack{
                 SecondaryScreen(text: "I am going to download for you ... ")
                 Text(text)
                    .padding()
                
            }.navigationTitle("Navigation title")
        }
        .onPreferenceChange(CustomTitlePreference.self, perform: {  value in
            self.text = value
        })
    }
}

extension View {
    func customTitle(_ text:String) -> some View{
        self
            .preference(key:CustomTitlePreference.self , value: text)
    }
}


struct SecondaryScreen:View {
    var text:String
    @State private var textFromDB:String = ""
    
    
    var body: some View{
        Text(text)
            //.preference(key: CustomTitlePreference.self ,value: "NEW VALUE")
            .onAppear{
                fetchFromDB()
            }
            .customTitle(textFromDB)
    }
    
    
    func fetchFromDB(){
        // download
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            self.textFromDB = "Text From DB to representing"
        }
    }
}

struct CustomTitlePreference: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        
        value = nextValue()
    }
}


struct PreferenceKeyBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootCamp()
    }
}



