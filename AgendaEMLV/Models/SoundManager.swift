//
//  SoundManager.swift
//  ToDoList
//
//  Created by Theo DOS REIS on 16/10/2022.
//

import Foundation
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "ding", withExtension: ".mp3") else { return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("Error\(error.localizedDescription)")
        }
    }
}
