//
//  Player.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 03/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

struct Player {
    let name:String
    let dateOfBirth:String
    let description:String
    let number:String
    let position:String
    
    var image:UIImage{
        switch name{
        case "Alisson":
            return UIImage(named: "alisson") ?? UIImage(named: "LFC")!
        case "Adrian":
            return UIImage(named: "adrian") ?? UIImage(named: "LFC")!
        case "Kelleher":
            return UIImage(named: "kelleher") ?? UIImage(named: "LFC")!
        case "Van Dijk":
            return UIImage(named: "vvd") ?? UIImage(named: "LFC")!
        case "Lovren":
            return UIImage(named: "lovren") ?? UIImage(named: "LFC")!
        case "Gomez":
            return UIImage(named: "gomez") ?? UIImage(named: "LFC")!
        case "Robertson":
            return UIImage(named: "robertson") ?? UIImage(named: "LFC")!
        case "Matip":
            return UIImage(named: "matip") ?? UIImage(named: "LFC")!
        case "Alexander Arnold":
            return UIImage(named: "taa") ?? UIImage(named: "LFC")!
        case "Fabinho":
            return UIImage(named: "fabinho") ?? UIImage(named: "LFC")!
        case "Wijnaldum":
            return UIImage(named: "wijnaldum") ?? UIImage(named: "LFC")!
        case "Milner":
            return UIImage(named: "milner") ?? UIImage(named: "LFC")!
        case "Keita":
            return UIImage(named: "keita") ?? UIImage(named: "LFC")!
        case "Henderson":
            return UIImage(named: "henderson") ?? UIImage(named: "LFC")!
        case "Oxlade Chamberlain":
            return UIImage(named: "ox") ?? UIImage(named: "LFC")!
        case "Lallana":
            return UIImage(named: "lallana") ?? UIImage(named: "LFC")!
        case "Shaqiri":
            return UIImage(named: "shaqiri") ?? UIImage(named: "LFC")!
        case "Firmino":
            return UIImage(named: "firmino") ?? UIImage(named: "LFC")!
        case "Mane":
            return UIImage(named: "mane") ?? UIImage(named: "LFC")!
        case "Salah":
            return UIImage(named: "salah") ?? UIImage(named: "LFC")!
        case "Origi":
            return UIImage(named: "origi") ?? UIImage(named: "LFC")!
        case "Clyne":
            return UIImage(named: "clyne") ?? UIImage(named: "LFC")!
        default:
            return UIImage(named: "LFC")!
        }
    }
}
