//
//  ProtocolBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 27/10/23.
//

import SwiftUI
// here we are going to use Protocols in our development
struct DefaultColorThem : ColorThemProtocol{
    let primary:Color = .blue
    let secondary:Color = .white
    let tertiary:Color = .gray
}

struct AlternativeColorThem: ColorThemProtocol{
    let primary:Color = .red
    let secondary:Color = .orange
    let tertiary:Color = .green
}

struct AnotherColorThem:ColorThemProtocol{
    var primary: Color = .blue
    var secondary: Color = .red
    var tertiary: Color = .purple
}

protocol ColorThemProtocol{
    var primary:Color {get}
    var secondary:Color {get}
    var tertiary:Color {get}
}

class DefaultDataSource:ButtonDataSourceProtocol{
    func buttonPressed() {
        print("Button just pressed ....")
    }
    
    var buttonText:String = "Protocols are awsome"
}
class AlternativeDataSource:ButtonTextProtocol{
    var buttonText:String = "Protocols are awsome and UseFull ... "
}
protocol ButtonTextProtocol{
    var buttonText:String {get}
}
protocol ButtonPressedProtocol{
    func buttonPressed()
}
protocol ButtonDataSourceProtocol: ButtonPressedProtocol, ButtonTextProtocol{
    
}
//protocol TextProtocol{
//    var text:String { get }
//}
//class TextDataSource: TextProtocol {
//    var text: String = "Hello world"
//}
//class TextDatasourceCustom: TextProtocol {
//    var text: String = "Hello world"
//}

struct ProtocolBootCamp: View {
    //let colorThem: DefaultColorThem = DefaultColorThem()
    //let colorThem: AlternativeColorThem = AlternativeColorThem()
    let colorThem: ColorThemProtocol
    let datasource: ButtonDataSourceProtocol
    var body: some View {
        ZStack{
            colorThem.tertiary
                .ignoresSafeArea()
            Text(datasource.buttonText)
                .font(.headline)
                .foregroundStyle(colorThem.secondary)
                .padding()
                .background(colorThem.primary)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    datasource.buttonPressed()
                }
        }
    }
}

#Preview {
    ProtocolBootCamp(colorThem: AnotherColorThem(), datasource: DefaultDataSource())
}
