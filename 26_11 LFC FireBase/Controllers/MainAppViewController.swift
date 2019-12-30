//
//  MainAppViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 29/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !defaults.bool(forKey: "userSawIntroduction"){
            let introductionSB = UIStoryboard(name: "Introduction", bundle: Bundle.main)
            guard let introductionVC = introductionSB.instantiateInitialViewController() else {return}
            present(introductionVC, animated: true)
            defaults.set(true, forKey: "userSawIntroduction")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
 

}
