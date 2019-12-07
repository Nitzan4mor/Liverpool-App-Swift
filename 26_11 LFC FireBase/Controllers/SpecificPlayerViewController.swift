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

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descriptionLabel.text = player.description
        
    }
    

   

}
