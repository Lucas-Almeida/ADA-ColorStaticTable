//
//  TableViewController.swift
//  ColorsStaticTable
//
//  Created by Lucas Pinheiro Almeida on 22/11/2018.
//  Copyright © 2018 Lucas Pinheiro Almeida. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    enum Colors: Int {
        case yellow
        case purple
        case blue
        case red
        case white
    }
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var yellowSwitch: UISwitch!
    @IBOutlet weak var purpleSwitch: UISwitch!
    
    @IBAction func didBlueSwitchTap(_ sender: UISwitch) {
        tableView.backgroundColor = .blue
        turnOffSwitches(selectedSwitch: blueSwitch, enumColor: Colors.blue.rawValue)
    }
    @IBAction func didRedSwitchTap(_ sender: UISwitch) {
        tableView.backgroundColor = .red
        turnOffSwitches(selectedSwitch: redSwitch, enumColor: Colors.red.rawValue)
    }
    @IBAction func didYellowSwitchTap(_ sender: UISwitch) {
        tableView.backgroundColor = .yellow
        turnOffSwitches(selectedSwitch: yellowSwitch, enumColor: Colors.yellow.rawValue)
    }
    @IBAction func didPurpleSwitchTap(_ sender: UISwitch) {
        tableView.backgroundColor = .purple
        turnOffSwitches(selectedSwitch: purpleSwitch, enumColor: Colors.purple.rawValue)
    }
    
    var arraySwitch: [UISwitch] = []
    
    func turnOffSwitches(selectedSwitch: UISwitch, enumColor: Colors.RawValue) {
        if selectedSwitch.isOn == false {
            tableView.backgroundColor = .white
            defaults.set(Colors.white.rawValue, forKey: "colors")
        } else {
            defaults.set(enumColor, forKey: "colors")
        }
        
        let newArray = arraySwitch.filter { $0 != selectedSwitch }
        for a in newArray {
            a.isOn = false
        }
    }
    
    func colorPersistence(enumColor: Colors.RawValue) {
        switch enumColor {
        case 0:
            yellowSwitch.isOn = true
            tableView.backgroundColor = .yellow
        case 1:
            purpleSwitch.isOn = true
            tableView.backgroundColor = .purple
        case 2:
            blueSwitch.isOn = true
            tableView.backgroundColor = .blue
        case 3:
            redSwitch.isOn = true
            tableView.backgroundColor = .red
        case 4:
            tableView.backgroundColor = .white
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arraySwitch.append(blueSwitch)
        arraySwitch.append(redSwitch)
        arraySwitch.append(yellowSwitch)
        arraySwitch.append(purpleSwitch)
        
        let c = Colors(rawValue: UserDefaults.standard.integer(forKey: "colors"))
        colorPersistence(enumColor: c!.rawValue)
//        let defaults = UserDefaults.standard
//
//        // adicionar chave
//        defaults.set(22, forKey: "age")
//        defaults.set([1,2,3,4,5,6], forKey: "numbers")
//        print(defaults.integer(forKey: "age"))
//        print(defaults.object(forKey: "numbers") as! [Int])
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
