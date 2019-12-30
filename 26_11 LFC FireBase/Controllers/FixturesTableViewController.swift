//
//  FixturesTableViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 27/11/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class FixturesTableViewController: UITableViewController {
    
    
    
    var fixtures:[Fixture] = []
    let database = LiverpoolDataBase.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = true
        
        database.getFixturesFromFireBase(delegate: self)
        
        //        for i in 0..<fixtures.count{
        //            if fixtures[i].status.count == 5{
        //                let indexPath = IndexPath(row: i, section: 0)
        //                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        //            }
        //        }
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fixtures.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fixtureCell", for: indexPath) as! FixtureTableViewCell
        
        let currentFixture = fixtures[indexPath.row]
        
        cell.dateLabel.text = currentFixture.date
        cell.homeTeamLabel.text = currentFixture.homeTeamName
        cell.awayTeamName.text = currentFixture.awayTeamName
        
        cell.homeTeamImage.image = currentFixture.homeTeamImage
        cell.awayTeamImage.image = currentFixture.awayTeamImage
        
//        if currentFixture.homeTeamName == "Liverpool"{
//            cell.homeTeamLabel.textColor = AppColors.red
//            cell.awayTeamName.textColor = .black
//        }
//        if currentFixture.awayTeamName == "Liverpool"{
//            cell.awayTeamName.textColor = AppColors.red
//            cell.homeTeamLabel.textColor = .black
//        }
        
        switch currentFixture.status {
        case "Won":
            cell.statusLabel.text = "Won"
            cell.statusLabel.textColor = AppColors.statusGreen
            break
        case "Lost":
            cell.statusLabel.text = "Lost"
            cell.statusLabel.textColor = .red
            break
        case "Draw":
            cell.statusLabel.text = "Draw"
            cell.statusLabel.textColor = .blue
            break
        default:
            cell.statusLabel.textColor = .systemTeal
            cell.statusLabel.text = currentFixture.status
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 2.9
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SpecificFixtureViewController else {return}
        guard let fixture = sender as? Fixture else {return}
        
        dest.fixture = fixture
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenFixture = fixtures[indexPath.row]
        if chosenFixture.score != ""{
            performSegue(withIdentifier: "goToSpecificFixture", sender: fixtures[indexPath.item])
        }else {
            let alertC = UIAlertController(title: "Sorry", message: "the fixture hasn't updated yet", preferredStyle: .alert)
            alertC.addAction(.init(title: "OK", style: .default, handler: nil))
            present(alertC, animated: true)
        }
    }
}

extension FixturesTableViewController : FixturesDataBaseDelegate{
    func getFixtures(fixtures: [Fixture]) {
        self.fixtures = fixtures
        tableView.reloadData()
        selectRowForNextGame()
    }
    
    func selectRowForNextGame(){
        for i in 0..<fixtures.count{
            if fixtures[i].status != "Won" && fixtures[i].status != "Draw" && fixtures[i].status != "Lost"{
                let indexPath = IndexPath(row: i, section: 0)
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
                return
            }
        }
    }
}
