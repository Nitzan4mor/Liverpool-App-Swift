//
//  MainAppViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 29/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let introductionSB = UIStoryboard(name: "Introduction", bundle: Bundle.main)
        guard let introductionVC = introductionSB.instantiateInitialViewController() else {return}
        
        present(introductionVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .darkGray


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
