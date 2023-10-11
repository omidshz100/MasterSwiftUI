//
//  UIViewRepresentableBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 11/10/23.
//

import SwiftUI

struct UIViewRepresentableBootCamp: View {
    @State var someTextHere:String = ""
    var body: some View {
        VStack{
            Text(someTextHere)
                .padding()
                .font(.title)
            Text("UIKit UIView only with background red.")
            BasicUIPreviewPresentable()
                .frame(height: 50)
            Text("SwiftUI only with placeholder")
            TextField("PlaceHolder...", text: $someTextHere)
                .frame(height: 50)
                .background(Color.blue)
            Text("UIKit UITextField only with background blue.")
            UITextFieldRepresentable(text: $someTextHere)
                .updatePlaceHolder("You can type here . ..")
                .frame(height: 50)
                .background(Color.blue)
        }
    }
}

// The way to Preview The code
// PreviewProvider instead you can tell compiler by using #Preview
//struct UIViewRepresentableBootCamp_Preview: PreviewProvider {
//    static var previews: some View {
//        UIViewRepresentableBootCamp()
//    }
//}

#Preview {
    UIViewRepresentableBootCamp()
}


struct BasicUIPreviewPresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}

struct UITextFieldRepresentable: UIViewRepresentable {
    @Binding var text:String
    var placeHolderText:String
    let placeHolderColor:UIColor
    
    init(text: Binding<String>, placeHolderText: String = "Default place holder...", placeHolderColor: UIColor = .red) {
        self._text = text
        self.placeHolderText = placeHolderText
        self.placeHolderColor = placeHolderColor
    }
    
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        
        return textField
    }
    // transfer data From SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = self.text
    }
    
    
    func updatePlaceHolder(_ text:String) -> UITextFieldRepresentable {
        var textfieldRepresentable = self
        textfieldRepresentable.placeHolderText = text
        
        return textfieldRepresentable
    }
    func getTextField()->UITextField {
        let textField = UITextField(frame: .zero)
        
        let placeHolder = NSAttributedString(string: placeHolderText, attributes: [.foregroundColor: placeHolderColor ])
        
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    // transfer data From UIKit to SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text:String
        
        init(text: Binding<String>) {
            self._text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.text = textField.text ?? ""
        }
    }
}
