//
//  AudioPlayer.swift
//  ABC
//
//  Created by Family Studio on 27.08.2022.
//

import AVFoundation

class AudioPlayer {
    
    //MARK: Properties
    
    var audioPlayer: AVAudioPlayer?
    
    //MARK: Methods
    
    func playWordSound(for word: Word) {
        let soundName = word.sound
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch let error {
                print(error.localizedDescription)
            }
    }
}
