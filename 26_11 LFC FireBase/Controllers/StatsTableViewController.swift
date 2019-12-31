//
//  StatsTableViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 07/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class StatsTableViewController: UITableViewController {
    
    let database = LiverpoolDataBase.shared
    
    var stats:[[String]] = [[]]
    
    let titles = ["Top Scorers","Top Assists","Most Minutes Played","General Stats"]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        database.getStatsFromFireBase(delegate: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return stats.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stats[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = AppColors.lightGray
        view.layer.borderColor = AppColors.gray.cgColor
        view.layer.borderWidth = 2
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = AppColors.lightRed
        header.textLabel?.font = UIFont(name: "Thonburi", size: 22)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell", for: indexPath)
        
        let stat = stats[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = stat

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

}

extension StatsTableViewController: StatsDataBaseDelegate {
    func getStats(stats: Stats, topScorers: [String], topAssists: [String], topMinutes: [String], general: [String]) {
        self.stats = [topScorers, topAssists, topMinutes, general]
        tableView.reloadData()
        
    }
    
    
}
