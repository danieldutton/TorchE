import SwiftUI

struct TorchView: View {
    private var torch = Torch()
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            Color.blue
                GeometryReader { geom in
                    VStack(alignment: .center) {
                    
                        Image(isOn ? "Torch_On" : "Torch_Off")
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
                                    torch.toggle(on: isOn)
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


