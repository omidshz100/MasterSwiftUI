//
//  NavigationView.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 15/08/23.
//

import SwiftUI



struct ExampleNavigationView: View {
    @ObservedObject private var model = Model()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Fruits", destination: ItemListView(items: self.model.fruits))
                    .isDetailLink(false)
                
                NavigationLink("Vegetables", destination: ItemListView(items: self.model.vegetables))
                    .isDetailLink(false)
            }

            
            Text("Nothing Selected")
        }
    }
    
    struct ItemListView: View {
        let items: [Item]
        
        var body: some View {
            List(items) { fruit in
                ItemRow(item: fruit)
            }
        }
    }

    struct ItemRow: View {
        let item: Item
        
        var body: some View {
            NavigationLink(destination: ItemView(item: item)) {
                HStack {
                    Image(item.image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(2)
                        .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
                        .shadow(radius: 3)
                        .padding(4)
                    
                    Text(item.name)
                        .font(.largeTitle)
                }
            }
        }
    }

    struct ItemView: View {
        let item: Item
        
        var body: some View {
            VStack {
                Image(item.image)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .padding(2)
                    .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
                    .shadow(radius: 3)
                    .padding(4)
                
                Text(item.name)
                    .font(.largeTitle)
            }
        }
    }

    struct Item: Identifiable {
        let id = UUID()
        let name: String
        let image: String
        let color: Color
    }

    class Model: ObservableObject {
        @Published var fruits: [Item] = loadFruits()
        @Published var vegetables: [Item] = loadVegetables()
        
        static func loadFruits() -> [Item] {
            return [
                Item(name: "Apple", image: "apple", color: .orange),
                Item(name: "Avocado", image: "avocado", color: .blue),
                Item(name: "Banana", image: "banana", color: .red),
                Item(name: "Grapes", image: "grapes", color: .pink),
                Item(name: "Kiwi", image: "kiwi", color: .purple),
                Item(name: "Peach", image: "peach", color: .green),
            ]
        }
        
        static func loadVegetables() -> [Item] {
            return [
                Item(name: "Spinach", image: "spinach", color: .red),
                Item(name: "Lettuce", image: "lettuce", color: .orange),
                Item(name: "Tomatoes", image: "tomatoes", color: .green),
                Item(name: "Onion", image: "onion", color: .blue),
            ]
        }
    }
}



struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleNavigationView()
    }
}
