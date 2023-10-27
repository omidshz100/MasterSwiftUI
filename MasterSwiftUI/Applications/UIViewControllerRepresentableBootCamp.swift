//
//  UIViewControllerRepresentableBootCamp.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 11/10/23.
//

import SwiftUI
import UIKit
import Photos


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
                checkPhotoLibraryPermission()
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
            UIImagePickerContrillerRepresenter(pickedImage: $image, isShowingPickerImage: $isShowingPickerImage)
        })
    }
    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            // Permission already granted
            print("Permission already granted")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    // Permission granted
                    print("Permission already granted  - 2 -")
                }
            }
        default:
            // Handle other cases (e.g., denied or restricted)
            print("Handle other cases (e.g., denied or restricted)")
        }
    }
}

struct UIImagePickerContrillerRepresenter:UIViewControllerRepresentable {
    
    @Binding var pickedImage:UIImage?
    @Binding var isShowingPickerImage:Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickeImageViewController = UIImagePickerController()
        pickeImageViewController.allowsEditing = false
        pickeImageViewController.delegate = context.coordinator
        return pickeImageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(image:  $pickedImage, showScreen: $isShowingPickerImage)
    }
    
    class Coordinator: NSObject ,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image:UIImage?
        @Binding var isShowingPickerImage:Bool
        
        init(image: Binding<UIImage?>, showScreen:Binding<Bool>) {
            self._image = image
            self._isShowingPickerImage = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else {return}
            self.image = newImage
            self.isShowingPickerImage = false
        }
        
    }
}

struct UIBasicViewControllerRepresentable:UIViewControllerRepresentable {
    @Binding var titleTxt:String
    
    
    func makeUIViewController(context: Context) -> ViewController {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        uiViewController.titleText.text = self.titleTxt
    }
    
}
#Preview {
    UIViewControllerRepresentableBootCamp()
}
