//
//  AudioPlayer.swift
//  AudioSpectrumAnimation
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019 huxq-coder. All rights reserved.
//

import UIKit
import AVFoundation


/// 音频播放类
class AudioPlayer {

    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    
    init() {
        engine.attach(player)
        engine.connect(player, to: engine.mainMixerNode, format: nil)
        engine.prepare()
        try! engine.start()
    }
    
    
    /// 播放音频
    ///
    /// - Parameter fileName: 音频名称
    func play(fileName: String) {
        guard let audioFileURL = Bundle.main.url(forResource: fileName, withExtension: nil), let audioFile = try? AVAudioFile(forReading: audioFileURL) else {
            return
        }
        player.scheduleFile(audioFile, at: nil, completionHandler: nil)
        player.play()
    }
    
    
    /// 停止音频
    func stop() {
        player.stop()
    }
    
    
    /// 暂停音频
    func pause() {
        player.pause()
    }
}
