//
//  LoopedVideoPlayer.swift
//  ABC
//
//  Created by Anna Nazarenko on 24.07.2022.
//

import AVFoundation

class LoopedVideoPlayer: AVPlayer {
    fileprivate var queuePlayer: AVQueuePlayer?
    fileprivate var playerLooper: AVPlayerLooper?
    var playerLayer: AVPlayerLayer?
    
    func prepareVideo(_ videoURL: String) {
        let playerItem = AVPlayerItem(url: URL(fileURLWithPath: videoURL))
        queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: queuePlayer)
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
        queuePlayer?.play()
        
        playerLayer!.videoGravity = .resizeAspectFill
    }
    
    override init() {
        super.init()
    }
}

