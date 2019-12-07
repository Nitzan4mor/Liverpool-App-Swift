//
//  ViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 26/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, FixturesDataBaseDelegate {
    func getFixtures(fixtures: [Fixture]) {
        print(fixtures)
    }
    
    
    let database = LiverpoolDataBase.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.getFixturesFromFireBase(delegate: self)
        
    }


}



