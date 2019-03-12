//
//  ViewController.swift
//  AudioSpectrumAnimation
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019 huxq-coder. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()

    @IBOutlet weak var audioNameLabel: UILabel!
    
    @IBAction func audioButton(_ sender: UIButton) {
        if !sender.isSelected {
            self.paly(fileName: audioNameLabel.text!)
        } else {
            self.stop()
        }
        
        sender.isSelected = !sender.isSelected
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取音频
        let audioNamePath = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil).last
        let audioName = audioNamePath?.components(separatedBy: "/").last
        audioNameLabel.text = audioName
        // 初始化
        engine.attach(player)
        engine.connect(player, to: engine.mainMixerNode, format: nil)
        engine.prepare()
        try! engine.start()
        
    }

    
    /// 播放
    ///
    /// - Parameter fileName: 音频名称
    func paly(fileName: String) {
        let audioFileURL = Bundle.main.url(forResource: fileName, withExtension: nil)
        let audioFile = try? AVAudioFile(forReading: audioFileURL!)
        player.scheduleFile(audioFile!, at: nil, completionHandler: nil)
        player.play()
        
    }
    
    
    /// 停止播放
    func stop() {
        player.stop()
    }
    

}

