//
//  SortingHelper.swift
//  26_11 LFC FireBase
//
//  Created by Nitzan Mor on 04/12/2019.
//  Copyright © 2019 Nitzan Mor. All rights reserved.
//

import UIKit

class SortingHelper {
    func sortFixtures(fixtures:[Fixture]) -> [Fixture]{
        var mutatingFixtures = fixtures
        var i = fixtures.count-1
        var isSorted = true
        while i > 0 {
            for j in 0..<i{
                if mutatingFixtures[j].dateForSorting > mutatingFixtures[j+1].dateForSorting {
                    let temp = mutatingFixtures[j]
                    mutatingFixtures[j] = mutatingFixtures[j+1]
                    mutatingFixtures[j+1] = temp
                    isSorted = false
                }
            }
            if isSorted {
                return mutatingFixtures
                
            }
            i-=1
        }
        return mutatingFixtures
    }

}
