//
//  SpecificFixtureViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 02/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit
import AVFoundation

class SpecificFixtureViewController: UIViewController {
    
    var player:AVAudioPlayer?

    var fixture:Fixture!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var refereeLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScorersLabel: UILabel!
    @IBOutlet weak var awayTeamScorersLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var homeTeamImage: CircularShadowedImageView!
    @IBOutlet weak var awayTeamImage: CircularShadowedImageView!
    
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAllezAllezAllez()
        
        dateLabel.text = "Date: \(fixture.date)"
        leagueLabel.text = "League: \(fixture.league)"
        stadiumLabel.text = "Stadium: \(fixture.stadium) in front of \(fixture.attendance) fans!"
        refereeLabel.text = "Referee: \(fixture.referee)"
        homeTeamLabel.text = "Home team: \(fixture.homeTeamName)"
        scoreLabel.text = "Score: \(fixture.score)"
        awayTeamLabel.text = "Away team: \(fixture.awayTeamName)"
        homeTeamScorersLabel.text = fixture.homeTeamScorers
        awayTeamScorersLabel.text = fixture.awayTeamScorers
        statusLabel.text = "Status: \(fixture.status)"
        homeTeamImage.image = fixture.homeTeamImage
        awayTeamImage.image = fixture.awayTeamImage

    }
    
    func playAllezAllezAllez(){
        guard let url = Bundle.main.url(forResource: "4.Allez Allez Allez", withExtension: "mp3") else {return}
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    


}
