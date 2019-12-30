//
//  SpecificPlayerViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 06/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class SpecificPlayerViewController: UIViewController {
    
    var player:Player!

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerImageView.layer.borderColor = AppColors.gray.cgColor
        playerImageView.layer.borderWidth = 4
        playerImageView.layer.cornerRadius = playerImageView.bounds.height / 10
        playerImageView.clipsToBounds = true
        
        playerImageView.image = player.image
        dateOfBirthLabel.text = "Date of birth: \(player.dateOfBirth)"
        nameLabel.text = "Name: \(player.name)"
        descriptionLabel.text = player.description
        
    }
    

   

}
