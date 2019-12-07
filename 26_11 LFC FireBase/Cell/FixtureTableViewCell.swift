//
//  FixtureTableViewCell.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 29/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    
    @IBOutlet weak var awayTeamImage: CircularShadowedImageView!
    
    @IBOutlet weak var homeTeamImage: CircularShadowedImageView!
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
}
