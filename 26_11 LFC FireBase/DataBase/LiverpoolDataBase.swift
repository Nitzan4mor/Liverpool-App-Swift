//
//  FixturesDataBase.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 27/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LiverpoolDataBase {
    
    static let shared:LiverpoolDataBase = LiverpoolDataBase()
    
    private init(){}
    
    private var ref: DatabaseReference!
    
    func getFixturesFromFireBase(delegate:FixturesDataBaseDelegate){
        DispatchQueue.global(qos: .userInteractive).async {
            self.ref = Database.database().reference().child("fixtures")
            self.ref.observe(.value) { (snapshot) in
                var fixtures:[Fixture] = []
                var arr = snapshot.value as? [Any]
                arr?.remove(at: 0)
                for item in arr!{
                    guard let dict = item as? [String:String] else {return}
                    let homeTeamName:String = dict["homeTeamName"] ?? "error"
                    let homeTeamLogo:String = dict["homeTeamLogo"] ?? "error"
                    let awayTeamLogo:String = dict["awayTeamLogo"] ?? "error"
                    let homeTeamScorers:String = dict["homeTeamScorers"] ?? "error"
                    let status:String = dict["status"] ?? "error"
                    let date:String = dict["date"] ?? "error"
                    let attendance:String = dict["attendance"] ?? "error"
                    let league:String = dict["league"] ?? "error"
                    let awayTeamName:String = dict["awayTeamName"] ?? "error"
                    let score:String = dict["score"] ?? "error"
                    let awayTeamScorers:String = dict["awayTeamScorers"] ?? "error"
                    let referee:String = dict["referee"] ?? "error"
                    let stadium:String = dict["stadium"] ?? "error"
                    let fixture = Fixture(homeTeamName: homeTeamName, homeTeamLogo: homeTeamLogo, awayTeamLogo: awayTeamLogo, homeTeamScorers: homeTeamScorers, status: status, date: date, attendance: attendance, league: league, awayTeamName: awayTeamName, score: score, awayTeamScorers: awayTeamScorers, referee: referee, stadium: stadium)
                    fixtures.append(fixture)
                }
                let sortedFixtures = SortingHelper().sortFixtures(fixtures: fixtures)
                DispatchQueue.main.async {
                    delegate.getFixtures(fixtures: sortedFixtures)
                }
            }
        }
        
    }
    
    func getSquadFromFireBase(delegate:SquadDataBaseDelegate){
        DispatchQueue.global(qos: .userInteractive).async {
            self.ref = Database.database().reference().child("squad")
            self.ref.observe(.value) { (snapshot) in
                var goalkeepers:[Player] = []
                var defenders:[Player] = []
                var midfielders:[Player] = []
                var forwards:[Player] = []
                var arr = snapshot.value as? [Any]
                arr?.remove(at: 0)
                for item in arr!{
                    guard let dict = item as? [String:String] else {return}
                    let name:String = dict["name"] ?? "error"
                    let dateOfBirth:String = dict["dateOfBirth"] ?? "error"
                    let description:String = dict["description"] ?? "error"
                    let number:String = dict["number"] ?? "error"
                    let position:String = dict["position"] ?? "error"
                    let player = Player(name: name, dateOfBirth: dateOfBirth, description: description, number: number, position: position)
                    switch position{
                    case "GOALKEEPER":
                        goalkeepers.append(player)
                        break
                    case "DEFENDER":
                        defenders.append(player)
                        break
                    case "MIDFIELDER":
                        midfielders.append(player)
                        break
                    case "FORWARD":
                        forwards.append(player)
                        break
                    default:
                        goalkeepers.append(player)
                    }
                }
                DispatchQueue.main.async {
                    delegate.getSquad(goalkeepers: goalkeepers, defenders: defenders, midfielders: midfielders, forwards: forwards)
                }
            }
        }
    }
    
    
    // used for OVER WRITING data in the FireBase Data Base ********
    //    func writeToDataBase(){
    //        self.ref = Database.database().reference().child("TableName")
    //
    //        for i in 1...25{
    //            self.ref.child(String(i)).setValue(["key": "value", "key": "value" ,"key": "value" ,"key": "value"  ])
    //
    //        }
    //    }
    
    
}

protocol FixturesDataBaseDelegate {
    func getFixtures(fixtures:[Fixture])
}

protocol SquadDataBaseDelegate {
    func getSquad(goalkeepers:[Player], defenders:[Player], midfielders:[Player], forwards:[Player])
}

