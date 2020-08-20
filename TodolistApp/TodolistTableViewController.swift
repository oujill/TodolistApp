//
//  TodolistTableViewController.swift
//  TodolistApp
//
//  Created by JillOU on 2020/8/19.
//  Copyright © 2020 Jillou. All rights reserved.
//

import UIKit

class TodolistTableViewController: UITableViewController {
    var lists = [List]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return lists.count
        }else{
            return 1
        }
    }

    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "todolistcell1", for: indexPath) as! TodolistTableViewCell
            cell1.layer.borderWidth = 10
            cell1.layer.borderColor = UIColor.white.cgColor
            if lists.count != 0{
                cell1.titleLabel.text = lists[indexPath.row].title
            }
            //print(lists.count)
            return cell1
        }else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "todolistcell2", for: indexPath) as! TodolistcreateTableViewCell
            cell2.layer.borderWidth = 10
            cell2.layer.borderColor = UIColor.white.cgColor
            return cell2
        }
    }
    
    @IBAction func unwindToTodolistTableViewController(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? EditTableViewController, let list = sourceViewController.list{
            if let indexPath = tableView.indexPathForSelectedRow, indexPath.section == 0{//修改待辦選項
                lists[indexPath.row] = list
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }else{//新增待辦選項
                lists.insert(list, at: 0)
                //print(lists[0].title)
                //新增動畫效果
                let indexPath = IndexPath(row: 0, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }

    //DELETE
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        lists.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        //tableView.reloadData()
    }
    
    //資料傳到細項頁面檢視
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? EditTableViewController
        if tableView.indexPathForSelectedRow?.section == 0, let row = tableView.indexPathForSelectedRow?.row{
            controller?.list = lists[row]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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



}
