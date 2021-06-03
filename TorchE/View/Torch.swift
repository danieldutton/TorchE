import AVFoundation
import SwiftUI

struct Torch: View {
    @State var isOn = false
    @State var sliderValue = 0.0
    
    var body: some View {
        ZStack {
            Color.blue
                GeometryReader { geom in
                        Slider(value: $sliderValue)
                            .padding()
                            .padding()
                    VStack(alignment: .center) {
                    
                        Image("Torch_Off")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 8)
                        .padding()
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .cornerRadius(45.0, antialiased: true)
                                //.shadow(radius: 30)
                            Toggle("", isOn: $isOn)
                                .frame(alignment: .center)
                        }
                    }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Torch_Previews: PreviewProvider {
    static var previews: some View {
        Torch()
    }
}


