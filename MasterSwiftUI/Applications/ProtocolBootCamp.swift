//
//  ProtocolBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 27/10/23.
//

import SwiftUI
// here we are going to use Protocols in our development
protocol TextProtocol{
    var text:String { get }
}
class TextDataSource: TextProtocol {
    var text: String = "Hello world"
}
class TextDatasourceCustom: TextProtocol {
    var text: String = "Hello world"
}

struct ProtocolBootCamp: View {
    var body: some View {
        Text(TextDataSource().text)
    }
}

#Preview {
    ProtocolBootCamp()
}
