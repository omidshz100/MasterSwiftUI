//
//  CustomNavBarView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 30/09/23.
//

import SwiftUI

struct CustomNavBarView: View {
    @State private var showBackButton:Bool = true
    @State private var title:String = "Title"
    @State private var subtitle:String? = "subtitle"
    
    var body: some View {
        HStack{
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges:[.top]))
    }
}

extension CustomNavBarView {
    private var preview: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection: some View {
        VStack{
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            Text(subtitle != nil ? "Subtitle":"")
            
        }
    }
}
#Preview {
    VStack{
        CustomNavBarView()
        Spacer()
    }
}
