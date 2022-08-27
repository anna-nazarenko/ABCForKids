//
//  AudioPlayer.swift
//  ABC
//
//  Created by Ольга on 27.08.2022.
//

import AVFoundation

class AudioPlayer: AVAudioPlayer {
    
    //MARK: Properties
    
    static var audioPlayer = AVAudioPlayer()
    
    //MARK: Methods
    
    static func playWordSound(for word: Word) {
        let soundName = word.sound
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                self.audioPlayer.play()
            } catch let error {
                print(error.localizedDescription)
            }
    }
}
