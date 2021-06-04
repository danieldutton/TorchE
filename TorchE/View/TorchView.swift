import SwiftUI

struct TorchView: View {
    private var torch = Torch()
    private var mp3Player = MP3Player()
    @State private var isOn = false

    var body: some View {
        ZStack {
            Color.blue
                GeometryReader { geom in
                    VStack(spacing: 0) {
                        TorchImage(isOn: isOn, geom: geom)
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: geom.size.height / 25.6)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                            ZStack {
                                TorchToggle(isOn: $isOn)
                            }
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




