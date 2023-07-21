import SwiftUI

let primaryColor = Color.orange

struct SunflowerView: View {
    @State private var seeds: Double = 100.0
    
    private var seedCount: Int {
        Int(seeds)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        SunflowerPainter(seeds: seedCount, size: geometry.size)
                            .frame(width: min(geometry.size.width, geometry.size.height),
                                   height: min(geometry.size.width, geometry.size.height))
                    }
                }
                
                Text("Showing \(seedCount) seeds")
                
                Slider(value: $seeds, in: 20...2000, step: 1)
                    .padding(.horizontal, 40)
            }
            .navigationTitle("Sunflower")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Info") {
                        // Action to show info
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .accentColor(primaryColor)
    }
}

struct SunflowerPainter: View {
    private let seedRadius: CGFloat = 2.0
    private let scaleFactor: CGFloat = 4
    private let tau = CGFloat.pi * 2
    private let phi = (sqrt(5) + 1) / 2
    
    private let seeds: Int
    private let size: CGSize
    
    init(seeds: Int, size: CGSize) {
        self.seeds = seeds
        self.size = size
    }
    
    var body: some View {
        ForEach(0..<seeds, id: \.self) { i in
            let theta = CGFloat(i) * tau / phi
            let r = sqrt(CGFloat(i)) * scaleFactor
            let x = size.width / 2 + r * cos(theta)
            let y = size.height / 2 - r * sin(theta)
            Circle()
                .fill(primaryColor)
                .frame(width: seedRadius * 2, height: seedRadius * 2)
                .position(x: x, y: y)
                .opacity(CGRect(x: 0, y: 0, width: size.width, height: size.height).contains(CGPoint(x: x, y: y)) ? 1 : 0)
        }
    }
}
