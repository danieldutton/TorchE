import SwiftUI

struct TorchView: View {
    private var torch = Torch()
    private var mp3Player = MP3Player()
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            Color.blue
                GeometryReader { geom in
                    VStack(alignment: .center) {
                        Image(isOn ? "Torch_On" : "Torch_Off")
                        .resizable()
                        .scaledToFit()
                            .frame(height: geom.size.height / 1.6)
                        .shadow(radius: 8)
                        .padding()
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.yellow)git 
                            Toggle("", isOn: $isOn)
                                .frame(alignment: .center)
                                .onChange(of: isOn, perform: { value in
                                    torch.toggle(on: isOn)
                                    mp3Player.playClick()
                                })
                        }
                    }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct TorchView_Previews: PreviewProvider {
    static var previews: some View {
        TorchView()
    }
}




