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
                                .onChange(of: isOn, perform: { value in
                                    toggleTorch(on: isOn)
                                })
                        }
                    }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
func toggleTorch(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }

    if device.hasTorch {
        do {
            try device.lockForConfiguration()

            if on == true {
                device.torchMode = .on
            } else {
                device.torchMode = .off
            }

            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }
 }
}

struct Torch_Previews: PreviewProvider {
    static var previews: some View {
        Torch()
    }
}


