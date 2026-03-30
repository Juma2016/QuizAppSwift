//
//  SoundManager.swift
//  QUIZ
//
//  Created by Mario Shenouda on 16.03.26.
//

import Foundation
import AVFoundation

class SoundManager {
    static var player: AVAudioPlayer?

    static func playSound(named soundName: String, withExtension ext: String = "mp3") {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: ext) else {
            print("Sound file \(soundName).\(ext) not found")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Could not play sound: \(error.localizedDescription)")
        }
    }
}
