//
//  PlistManager.swift
//  DataManager
//
//  Created by Qing Lin on 11/01/16.
//  Copyright © 2016 Columbia University. All rights reserved.
//

import Foundation


class PlistManager {
    // Default plist for loading
    let defaultFilename:String = "MyData"
    
    // The main array for loaded data
    var dataArray: [[String:Any]] = []
    
    // initializing
    init() {
        if let newArray = readArrayFromFile(filename:defaultFilename) {
            dataArray = newArray
            print("Load file successfully!")
        } else {
            print("No file found!")
        }
    }
    
    
    // MARK: - PList Reading
    // read array from file
    private func readArrayFromFile(filename:String) -> [[String:Any]]? {
        var myArray: NSArray?
        if let path = Bundle.main.path(forResource: filename, ofType: "plist") {
            myArray = NSArray(contentsOfFile: path)
        }
        if myArray != nil {
            return myArray as! [[String : Any]]?
        } else {
            return nil
        }
    }
    
    
    // MARK: - PList searching
    func generalSearching(fullName: String?) -> [UserData]? {
        var explicitSearchResult:[UserData] = []
        if let result = explicitSearch(fullName: fullName) {
            explicitSearchResult += result
        }
        if explicitSearchResult.count == 0 {
            return nil
        }
        return explicitSearchResult
    }
    
    private func explicitSearch(fullName: String?) -> [UserData]? {
        if fullName == nil {
            return nil
        }
        
        var outputUserData: [UserData] = []
        // loop over data array
        for oneUserDataArray in dataArray {
            let oneUserData = UserData(dict: oneUserDataArray)
            if ((oneUserData.userFullName?.lowercased().range(of: (fullName?.lowercased())!)) != nil) {
                outputUserData.append(oneUserData)
                print(oneUserData.userFullNameWithMiddle!)
            }
            else if ((oneUserData.userFullNameWithMiddle?.lowercased().range(of: (fullName?.lowercased())!)) != nil) {
                outputUserData.append(oneUserData)
                print(oneUserData.userFullNameWithMiddle!)
            }
        }
        return outputUserData
    }
    
    // as a backup search method, not used now.
    private func fuzzySearch(fullName: String?) -> [UserData]? {
        if fullName == nil {
            return nil
        }
        
        var outputUserData: [UserData] = []
        // split the name into sub-names
        var subNames = fullName!.components(separatedBy: " ")
        // replace the string if it contains " "
        for (index, subName) in subNames.enumerated() {
            let newSubName = subName.replacingOccurrences(of: " ", with: "")
            subNames[index] = newSubName
        }
        // remove the sub-name if it is only ""
        for (index, subName) in subNames.enumerated() {
            if subName == "" {
                subNames.remove(at: index)
            }
        }
        // loop over data array
        for oneUserDataArray in dataArray {
            let oneUserData = UserData(dict: oneUserDataArray)
            // loop over sub-names
            for subName in subNames {
                if ((oneUserData.userFullName?.lowercased().range(of: (subName.lowercased()))) != nil) {
                    outputUserData.append(oneUserData)
                    print(oneUserData.userFullNameWithMiddle!)
                }
            }
        }
        return outputUserData
    }
}
