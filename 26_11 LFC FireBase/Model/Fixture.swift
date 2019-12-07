//
//  Fixture.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 27/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

struct Fixture{

    let homeTeamName:String
    let homeTeamLogo:String
    let awayTeamLogo:String
    let homeTeamScorers:String
    let status:String
    let date:String
    let attendance:String
    let league:String
    let awayTeamName:String
    let score:String
    let awayTeamScorers:String
    let referee:String
    let stadium:String
    
    var homeTeamImage:UIImage{
        getImageFromLogo(team: homeTeamLogo)
    }
    
    var awayTeamImage:UIImage{
        getImageFromLogo(team: awayTeamLogo)
    }
    
    var dateForSorting:Int{
        let dateArr = self.date.split(separator: "/")
        let dateForSorting:String = String(dateArr[2] + dateArr[1] + dateArr[0])
        return Int(dateForSorting) ?? 0
    }
    
    private func getImageFromLogo(team:String) -> UIImage{
        switch team{
        case "ARS":
            return UIImage(named: "ARS")!
            case "AVL":
            return UIImage(named: "AVL")!
            case "BOU":
            return UIImage(named: "BOU")!
            case "BRI":
            return UIImage(named: "BRI")!
            case "BUR":
            return UIImage(named: "BUR")!
            case "CHE":
            return UIImage(named: "CHE")!
            case "CRY":
            return UIImage(named: "CRY")!
            case "EVE":
            return UIImage(named: "EVE")!
            case "GNK":
            return UIImage(named: "GNK")!
            case "LEI":
            return UIImage(named: "LEI")!
            case "LFC":
            return UIImage(named: "LFC")!
            case "MCI":
            return UIImage(named: "MCI")!
            case "MKD":
            return UIImage(named: "MKD")!
            case "MUN":
            return UIImage(named: "MUN")!
            case "NAP":
            return UIImage(named: "NAP")!
            case "NEW":
            return UIImage(named: "NEW")!
            case "NOR":
            return UIImage(named: "NOR")!
            case "SAL":
            return UIImage(named: "SAL")!
            case "SHU":
            return UIImage(named: "SHU")!
            case "SOU":
            return UIImage(named: "SOU")!
            case "TOT":
            return UIImage(named: "TOT")!
            case "WAT":
            return UIImage(named: "WAT")!
            case "WHU":
            return UIImage(named: "WHU")!
            case "WOL":
            return UIImage(named: "WOL")!
            
        default:
            return UIImage(named: "LFC")!
        }
    }
    
}
