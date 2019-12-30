//
//  SongsViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 30/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit
import AVFoundation

class SongsViewController: UIViewController {

    var player:AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func playAllezAllezAllez(_ sender: UIButton) {
        playSong(name: "Allez Allez Allez")
    }
    
    @IBAction func playYNWA(_ sender: UIButton) {
        playSong(name: "YNWA")
    }
    
    @IBAction func playWeLoveYouLiverpool(_ sender: UIButton) {
        playSong(name: "We Love You Liverpool")
    }
    
    
    @IBAction func playBobbyFirminoSong(_ sender: UIButton) {
        playSong(name: "Bobby Firmino Song")
    }
    
    @IBAction func playMoSalahSong(_ sender: UIButton) {
        playSong(name: "Mo Salah Song")
    }
    
    
    @IBAction func playVirgilVanDijkSong(_ sender: UIButton) {
        playSong(name: "Virgil Van Dijk Song")
    }
    
    @IBAction func stopPlaying(_ sender: UIButton) {
        player?.stop()
    }
    
    func playSong(name:String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {return}
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}
