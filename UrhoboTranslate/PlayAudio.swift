//
//  PlayAudio.swift
//  UrhoboTranslate
//
//  Created by Ufuoma Okoro on 14/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//
//File to play the audio sound for applicaiton

import Foundation
import AVFoundation


//Audio Player

var audioPlayer: AVAudioPlayer?

//Function to play audio file

func playSound(sound: String, type: String) {
    
    //Set sound file path - Pass through sound and type parameters
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                
            audioPlayer?.play()
            
          //Catch Error it file cannot be found
        } catch {
            
            print("Unable to find file")
        }
    }
}


