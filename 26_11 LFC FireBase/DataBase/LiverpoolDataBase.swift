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
    
    func getStatsFromFireBase(delegate:StatsDataBaseDelegate){
        DispatchQueue.global(qos: .userInteractive).async {
            self.ref = Database.database().reference().child("stats")
            self.ref.observe(.value) { (snapshot) in
                var topScorers:[String] = []
                var topAssists:[String] = []
                var topMinutes:[String] = []
                var general:[String] = []
                var stats:Stats?
                var arr = snapshot.value as? [Any]
                arr?.remove(at: 0)
                for item in arr!{
                    guard let dict = item as? [String:String] else {return}
                    let biggestDefeat:String = dict["biggestDefeat"] ?? "error"
                    let biggestVictory:String = dict["biggestVictory"] ?? "error"
                    let highestScoreMatch:String = dict["highestScoreMatch"] ?? "error"
                    let topAssistOne:String = dict["topAssistOne"] ?? "error"
                    let topAssistThree:String = dict["topAssistThree"] ?? "error"
                    let topAssistTwo:String = dict["topAssistTwo"] ?? "error"
                    let topMinutesOne:String = dict["topMinutesOne"] ?? "error"
                    let topMinutesThree:String = dict["topMinutesThree"] ?? "error"
                    let topMinutesTwo:String = dict["topMinutesTwo"] ?? "error"
                    let topScorerOne:String = dict["topScorerOne"] ?? "error"
                    let topScorerThree:String = dict["topScorerThree"] ?? "error"
                    let topScorerTwo:String = dict["topScorerTwo"] ?? "error"
                    let gamesPlayed:String = dict["gamesPlayed"] ?? "error"
                    let gamesWon:String = dict["gamesWon"] ?? "error"
                    let gamesLost:String = dict["gamesLost"] ?? "error"
                    let gamesDrawn:String = dict["gamesDrawn"] ?? "error"

                    stats = Stats(biggestDefeat: biggestDefeat, biggestVictory: biggestVictory, highestScoreMatch: highestScoreMatch, topAssistOne: topAssistOne, topAssistThree: topAssistThree, topAssistTwo: topAssistTwo, topMinutesOne: topMinutesOne, topMinutesThree: topMinutesThree, topMinutesTwo: topMinutesTwo, topScorerOne: topScorerOne, topScorerThree: topScorerThree, topScorerTwo: topScorerTwo, gamesPlayed: gamesPlayed, gamesWon: gamesWon, gamesDrawn: gamesDrawn, gamesLost: gamesLost)
                    
                    topScorers.append("1) \(topScorerOne)")
                    topScorers.append("2) \(topScorerTwo)")
                    topScorers.append("3) \(topScorerThree)")
                    
                    topAssists.append("1) \(topAssistOne)")
                    topAssists.append("2) \(topAssistTwo)")
                    topAssists.append("3) \(topAssistThree)")
                    
                    topMinutes.append("1) \(topMinutesOne)")
                    topMinutes.append("2) \(topMinutesTwo)")
                    topMinutes.append("3) \(topMinutesThree)")
                    
                    general.append("Biggest victory - \(biggestVictory)")
                    general.append("Biggest defeat - \(biggestDefeat)")
                    general.append("Highest score match - \(highestScoreMatch)")
                    general.append("Liverpool played \(gamesPlayed) official games this season")
                    general.append("Liverpool won \(gamesWon) games, drawn \(gamesDrawn) and lost \(gamesLost)")
                }
                
                DispatchQueue.main.async {
                    delegate.getStats(stats: stats!, topScorers: topScorers, topAssists: topAssists, topMinutes: topMinutes, general: general)
                }
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




protocol FixturesDataBaseDelegate {
    func getFixtures(fixtures:[Fixture])
}

protocol SquadDataBaseDelegate {
    func getSquad(goalkeepers:[Player], defenders:[Player], midfielders:[Player], forwards:[Player])
}

protocol StatsDataBaseDelegate {
    func getStats(stats:Stats,topScorers:[String], topAssists:[String], topMinutes:[String], general:[String])
}

