//
//  UserData.swift
//  DataManager
//
//  Created by Qing Lin on 11/01/16.
//  Copyright © 2016 Columbia University. All rights reserved.
//

import Foundation

struct UserData {
    // MARK: - User Data Structure
    var userFullName: String?
    var userFullNameWithMiddle: String?
    var userAge: Int?
    var userGender: String?
    var userCity: String?
    var userPosition: String?
    
    // MARK: - Initializing
    init() {
    }
    
    
    init(dict: [String:Any])
    {
        var firstName:String = ""
        var middleName: String = ""
        var lastName: String = ""
        if dict["first_name"] != nil {
            firstName = dict["first_name"]! as! String
        }
        if dict["middle_name"] != nil {
            middleName = dict["middle_name"]! as! String
        }
        if dict["last_name"] != nil {
            lastName = dict["last_name"]! as! String
        }
        if dict["age"] != nil {
            userAge = dict["age"]! as? Int
        }
        if dict["gender"] != nil {
            userGender = dict["gender"]! as? String
        }
        if dict["city"] != nil {
            userCity = dict["city"]! as? String
        }
        if dict["position"] != nil {
            userPosition = dict["position"]! as? String
        }
        // merge to the full name 
        userFullName = firstName + " " + lastName
        userFullNameWithMiddle = firstName + " " + middleName + " " + lastName
    }
}
