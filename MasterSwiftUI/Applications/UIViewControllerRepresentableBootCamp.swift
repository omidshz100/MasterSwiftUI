//
//  UIViewControllerRepresentableBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 11/10/23.
//

import SwiftUI
import UIKit


struct UIViewControllerRepresentableBootCamp: View {
    @State private var showingPopUp:Bool = false
    @State var userText:String = ""
    @State var image:UIImage? = nil
    @State var isShowingPickerImage:Bool = false
    
    
    var body: some View {
        
        VStack{
            
            if let img = image {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            TextField("write title here .... ", text: $userText)
                .padding()
            
            Button {
                showingPopUp.toggle()
            } label: {
                Text("Click me to show!")
            }
            
            Button {
                isShowingPickerImage.toggle()
            } label: {
                Text("Click to pick image")
            }
            .padding()
        }
        .sheet(isPresented: $showingPopUp, content: {
            UIBasicViewControllerRepresentable(titleTxt: $userText)
        })
        .sheet(isPresented: $isShowingPickerImage, content: {
            UIImagePickerContrillerRepresenter(pickedImage: $image)
        })
    }
}

struct UIImagePickerContrillerRepresenter:UIViewControllerRepresentable {
    
    @Binding var pickedImage:UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickeImageViewController = UIImagePickerController()
        
        return pickeImageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(pickedImage: $pickedImage)
    }
    
    class Coordinator: NSObject ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var pickedImage:UIImage
        
        init(pickedImage: Binding<UIImage>) {
            self._pickedImage = pickedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let newImage = info[.originalImage] as? UIImage else {return}
            
            self.pickedImage = newImage
        }
        
    }
}

struct UIBasicViewControllerRepresentable:UIViewControllerRepresentable {
    @Binding var titleTxt:String
    
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
        uiViewController.titleText.text = self.titleTxt
    }
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        
        return vc
    }
}
#Preview {
    UIViewControllerRepresentableBootCamp()
}
