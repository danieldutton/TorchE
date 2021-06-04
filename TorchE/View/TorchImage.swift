import SwiftUI

struct TorchImage: View {
    let isOn: Bool
    let geom: GeometryProxy
    
    var body: some View {
        Image(isOn ? "Torch_On" : "Torch_Off")
        .resizable()
        .scaledToFit()
        .frame(height: geom.size.height / 1.6)
        .shadow(radius: 8)
        .padding()
        .rotationEffect(Angle.degrees(isOn ? 360: 0))
        .animation(Animation.easeOut)
    }
}
