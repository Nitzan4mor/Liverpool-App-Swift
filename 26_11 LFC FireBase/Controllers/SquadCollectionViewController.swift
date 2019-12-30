//
//  SquadCollectionViewController.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 03/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit


class SquadCollectionViewController: UICollectionViewController {
    
    var squad:[[Player]] = []
    let database = LiverpoolDataBase.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.getSquadFromFireBase(delegate: self)
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true
        
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SpecificPlayerViewController else {return}
        guard let player = sender as? Player else {return}
        dest.player = player
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSpecific", sender: squad[indexPath.section][indexPath.item])
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return squad.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return squad[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "squadCell", for: indexPath) as! SquadCollectionViewCell
        
        let player = squad[indexPath.section][indexPath.item]
        
        cell.nameLabel.text = player.name
        cell.numberLabel.text = player.number
        
        cell.imageView.image = player.image
    
        cell.layer.borderWidth = 3
        cell.layer.borderColor = AppColors.gray.cgColor
        
        cell.imageView.layer.borderColor = AppColors.gray.cgColor
        cell.imageView.layer.borderWidth = 1.5
        cell.imageView.layer.cornerRadius = cell.imageView.bounds.width / 10
        cell.imageView.clipsToBounds = true
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! SquadCollectionReusableView
            
            let headerText = "\(squad[indexPath.section][indexPath.item].position)S"
            headerView.headerLabel.text = headerText
            
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            
            footerView.backgroundColor = UIColor.green
            return footerView
            
        default:
            assert(false, "Unexpected element kind")
            return UICollectionReusableView()
        }
    }
    
}

extension SquadCollectionViewController : SquadDataBaseDelegate{
    func getSquad(goalkeepers: [Player], defenders: [Player], midfielders: [Player], forwards: [Player]) {
        self.squad = [goalkeepers, defenders, midfielders , forwards]
        collectionView.reloadData()
    } 
}
