//
//  LoopedVideoPlayerView.swift
//  ABC
//
//  Created by Friendly Family Studio on 24.07.2022.
//

import AVFoundation
import UIKit

class LoopedVideoPlayerView: UIView {
    
    //MARK: Properties
    
    private var queuePlayer: AVQueuePlayer?
    private var playerLooper: AVPlayerLooper?
    private var playerLayer: AVPlayerLayer?
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: View Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let playerLayer = playerLayer else { return }
        
        playerLayer.frame = bounds
        layer.addSublayer(playerLayer)
    }
    
    //MARK: Methods
    
    func prepareVideo(_ videoURL: URL) {
        let playerItem = AVPlayerItem(url: videoURL)
        
        queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: queuePlayer)
        
        guard let queuePlayer = queuePlayer, let playerLayer = playerLayer else { return }

        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        playerLayer.videoGravity = .resizeAspectFill
    }
    
    func pauseVideo() {
        queuePlayer?.pause()
    }
    
    func playVideo() {
        queuePlayer?.play()
    }
}
