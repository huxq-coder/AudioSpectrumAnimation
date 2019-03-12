//
//  ViewController.swift
//  AudioSpectrumAnimation
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019 huxq-coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let player = AudioPlayer()
    
    @IBOutlet weak var audioNameLabel: UILabel!
    
    @IBAction func audioButton(_ sender: UIButton) {
        if !sender.isSelected {
            player.play(fileName: audioNameLabel.text!)
        } else {
            player.pause()
        }
        
        sender.isSelected = !sender.isSelected
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 获取音频
        let audioNamePath = Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil).last
        let audioName = audioNamePath?.components(separatedBy: "/").last
        audioNameLabel.text = audioName
    }
    

}

