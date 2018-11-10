//
//  FirstViewController.swift
//  AppFall
//
//  Created by Adrian Baumgart on 10.11.18.
//  Copyright © 2018 Adrian Baumgart. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func AddItemBtn(_ sender: Any)
    {
        self.AddITEM(title: "Hinzufügen", message: "")
    }
    @IBOutlet weak var ItemList: UITableView!
    var itemNames:[String] = []
    var itemMenge:[String] = []
    var databasekeys: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "listcell")
        cell.textLabel?.text = itemNames[indexPath.row]
        cell.detailTextLabel?.text = itemMenge[indexPath.row]
        return cell
    }
    
    func LoadData() {
        itemNames.removeAll()
        itemMenge.removeAll()
        let ref: DatabaseReference
        ref = Database.database().reference()
        /*ref.child("Listen").child("SinnloseListe").observe(.value, with: { (snapshot) in
         let SNAP = snapshot.value as? String
         self.items.append(SNAP!)
         self.ItemList.reloadData()
         })*/
        ref.child("list").observe(.value) { (snapshot) in
            //let SNAPP = snapchot.children as? String
            if let item = snapshot.value as? [String:AnyObject]{
                self.databasekeys = Array(item.keys)
                print(self.databasekeys)
                let dbkC = self.databasekeys.count
                for key in self.databasekeys {
                    //print(item[keys]!["Name"])
                    var iN = item[key]!["Name"] //as! String
                    var iM = item[key]!["Menge"] //as! String
                    
                    print(iM)
                   //print(item[keys]!["Menge"])
                    self.itemNames.append(iN as! String)
                    self.itemMenge.append(iM as! String)
                }
                //print(item["Name"])
               // self.items.append(item)
                self.ItemList.reloadData()
            }
            // print("WICHTIG \(snapchot.value as? String)")
            
        }
    }
    @IBOutlet weak var ListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
       // let ref: DatabaseReference
        //ref = Database.database().reference()
        //LoadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     func randomString(length: Int) -> String {
       let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        return String((0...length-1).map{_ in letters.randomElement()!})
    }
    func AddITEM (title: String, message: String) {
        let AI = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
 
        AI.addTextField(
            configurationHandler: {(textField: UITextField!) in
                textField.placeholder = "Name"
        })
        
        AI.addTextField(
            configurationHandler: {(textField: UITextField!) in
                textField.placeholder = "Menge"
        })
        
        AI.addAction(UIAlertAction(title: "Hinzufügen", style: UIAlertAction.Style.default, handler: { (AIAdd) in
            if let textFields = AI.textFields {
                let theTextFields = textFields as [UITextField]
                let enteredText = theTextFields[0].text
                let enteredAmount = theTextFields[1].text
                //self!.displayLabel.text = enteredText
                if enteredText != "" && enteredAmount != "" {
                let ref: DatabaseReference
                ref = Database.database().reference()
                    
                    ref.child("list").child(enteredText!).child("Name").setValue(enteredText)
                    ref.child("list").child(enteredText!).child("Menge").setValue(enteredText)
                    self.itemNames.removeAll()
                    self.itemMenge.removeAll()
                    self.ItemList.reloadData()
                   // ItemList.
                    self.LoadData()
                    
                    AI.dismiss(animated: true, completion: nil)
                    
                }
            }
            
        }))
        self.present(AI, animated: true, completion: nil)
    }


}

