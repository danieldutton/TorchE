import Foundation
import SwiftUI

struct TorchToggle: View {
    @Binding var isOn: Bool
    var torch = Torch()
    var mp3Player = MP3Player()

    var body: some View {
        Toggle("", isOn: $isOn)
            .frame(alignment: .center)
            .labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: .orange))
            .scaleEffect(1.4)
            .onChange(of: isOn, perform: { value in
                torch.toggle(on: isOn)
                mp3Player.playClick()
        })
    }
}
