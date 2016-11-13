//
//  DataManagerTableViewController.swift
//  DataManager
//
//  Created by Qing Lin on 11/01/16.
//  Copyright © 2016 Columbia University. All rights reserved.
//

import UIKit

class DataManagerTableViewController: UITableViewController, UITextFieldDelegate {

    // MARK: - Plist Model
    var plistDataSource = PlistManager()
    
    var searchText: String? = "" {
        didSet {
            searchTextField?.text = searchText
            tableView.reloadData()
            updateSearch()
        }
    }
    
    var userDataForShowing: [UserData] = []
    
    private func updateSearch() {
        if searchText == nil {
            return
        }
        // clean the array
        if userDataForShowing.count != 0 {
            userDataForShowing.removeAll()
        }
        if let searchResult = plistDataSource.generalSearching(fullName: searchText!) {
            userDataForShowing = searchResult
        }
        tableView.reloadData()
    }
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSearch()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField.text = searchText
        }
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchTextField {
            textField.becomeFirstResponder()
        }
    }
    

    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("The text field is returned!")
        if textField == searchTextField {
            textField.resignFirstResponder()
            searchText = textField.text
        }
        return true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return userDataForShowing.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataDisplay") as! DataManagerTableViewCell
        cell.oneUserData = userDataForShowing[indexPath.section]
        return cell
    }

}
