//
//  IntroductionViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 01/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet weak var heightLiverpoolLogo: NSLayoutConstraint!
    
    @IBOutlet weak var introductionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        in here you will find Liverpool's fixtures, squad and stats of 2019/2020 season!
        and you will be able to get in the Anfield mood with fan's songs!
        to get started either swipe down or tap the Liverpool logo beneath, Enjoy!
        """
    }

    @IBAction func liverpoolLogoTapped(_ sender: UITapGestureRecognizer) {
        heightLiverpoolLogo.constant = 0
        dismiss(animated: true)
    }
}
