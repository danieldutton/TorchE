import AVFoundation
import Foundation

class MP3Player {
    private var player: AVAudioPlayer?
    
    func playClick() {
        let path = Bundle.main.path(forResource: "button_click.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            //do nothing
        }
    }
}
