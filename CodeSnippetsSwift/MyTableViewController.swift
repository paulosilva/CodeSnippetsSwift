//
//  MyTableViewController.swift
//  CodeSnippetsSwift
//
//  Created by Paulo Silva on 21/01/2018.
//  Copyright © 2018 Paulo Silva. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    @IBAction func dismissViewAction(_ sender: Any) {
        self.dismiss(animated: true) {() -> Void in }
    }
    
    // PS-TableView-Implementation
    // MARK: - Table view Implementation
    /*
     , UITableViewDelegate, UITableViewDataSource
     
     @IBOutlet weak var tableView: UITableView!
     
     //
     self.tableView.delegate = self
     self.tableView.dataSource = self
     
     */
    
    // MARK: - Table view

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor(red: 62 / 255.0, green: 68 / 255.0, blue: 75 / 255.0, alpha: 1.0)
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 17)!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 34))
        view.backgroundColor = UIColor(red: 167 / 255.0, green: 167 / 255.0, blue: 167 / 255.0, alpha: 0.6)
        let label = UILabel(frame: CGRect(x: 10, y: 8, width: 0, height: 0))
        label.text = "Friends Online"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        label.sizeToFit()
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 34
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*
        tableView.deselectRow(at: indexPath, animated: true)
        //
        let navigationController = storyboard.instantiateViewController(withIdentifier: "contentController") as? DEMONavigationController
        if indexPath.section == 0 && indexPath.row == 0 {
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "homeController") as? DEMOHomeViewController
            navigationController.viewControllers = [homeViewController]
        }
        else {
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "secondController") as? DEMOSecondViewController
            navigationController.viewControllers = [secondViewController]
        }
        frostedViewController.contentViewController = navigationController as? UIViewController ?? UIViewController()
        frostedViewController.hideMenuViewController()
        */
        
    }

    // MARK: - Table view
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        if indexPath.section == 0 {
            let titles = ["Home", "Profile", "Chats"]
            cell?.textLabel?.text = titles[indexPath.row]
        }
        else {
            let titles = ["John Apple", "John Doe", "John User"]
            cell?.textLabel?.text = titles[indexPath.row]
        }
        return cell ?? UITableViewCell()
    }
    
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
