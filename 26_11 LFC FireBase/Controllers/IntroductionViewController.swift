//
//  IntroductionViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 01/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit
import AVFoundation

class IntroductionViewController: UIViewController {
    var player:AVAudioPlayer?
    @IBOutlet weak var heightLiverpoolLogo: NSLayoutConstraint!
    
    @IBOutlet weak var introductionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        playYNWA()
        
        introductionLabel.text = introductionText
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heightLiverpoolLogo.constant = 150
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.4, options: [], animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    var introductionText:String{
        return """
        Greetings fellow liverpool supporter!
        as the liverpool players take the field, in here as well
        You'll Never Walk Alone!
        this app provides you Liverpool's fixtures, squad and stats of 2019/2020 season!
        to get started either swipe down or tap the Liverpool logo beneath, Enjoy!
        """
    }
    
    
    func playYNWA(){
        guard let url = Bundle.main.url(forResource: "Gerry And The Pacemakers - Youll Never Walk Alone", withExtension: "mp3") else {return}
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }

    @IBAction func liverpoolLogoTapped(_ sender: UITapGestureRecognizer) {
        heightLiverpoolLogo.constant = 0
        dismiss(animated: true)
    }
}
