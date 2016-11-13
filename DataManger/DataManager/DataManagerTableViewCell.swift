//
//  DataManagerTableViewCell.swift
//  DataManager
//
//  Created by Qing Lin on 11/01/16.
//  Copyright © 2016 Columbia University. All rights reserved.
//

import UIKit

class DataManagerTableViewCell: UITableViewCell
{
    // public API
    var oneUserData: UserData? {
        didSet {
            updateUI()
        }
    }

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    func updateUI() {
        if oneUserData==nil {
            fullNameLabel.text = "Name: N/A"
            ageLabel.text = "Age: N/A"
            genderLabel.text = "Gender: N/A"
            cityLabel.text = "City: N/A"
            positionLabel.text = "Position: N/A"
            return
        }
        
        if let fullName = oneUserData!.userFullNameWithMiddle {
            fullNameLabel.text = "Name: "+fullName
        } else {
            fullNameLabel.text = "Name: N/A"
        }
        if let age = oneUserData!.userAge {
            ageLabel.text = "Age: \(age)"
        } else {
            ageLabel.text = "Age: N/A"
        }
        if let gender = oneUserData!.userGender {
            genderLabel.text = "Gender: "+gender
        } else {
            genderLabel.text = "Gender: N/A"
        }
        if let city = oneUserData!.userCity {
            cityLabel.text = "City: "+city
        } else {
            cityLabel.text = "City: N/A"
        }
        if let position = oneUserData!.userPosition {
            positionLabel.text = "Position: "+position
        } else {
            positionLabel.text = "Position: N/A"
        }
        return
    }
    
}
