//
//  EditTableViewController.swift
//  TodolistApp
//
//  Created by JillOU on 2020/8/19.
//  Copyright © 2020 Jillou. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
    var list:List?
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var detailLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //點done收鍵盤
        titleLabel.addTarget(self, action: #selector(closekeyboard), for: .editingDidEndOnExit)
        //show出選取代辦選項的資料
        titleLabel.text = list?.title
        detailLabel.text = list?.detail
        
    }
    //點done收鍵盤
    @objc func closekeyboard(){
    }
    //點空白處收鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //傳值回列表頁
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let title = titleLabel.text ?? ""
            let detail = detailLabel.text ?? ""
            list = List(title: title, detail: detail)
    }
    
    //防呆設計（檢查至少要有標題欄位）
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if titleLabel.text?.isEmpty == false{//title有東西，回傳true允許跳回去
            return true
        }else{//title沒輸入，跳出警告視窗並回傳false不能跳回去
            let alertcontroller = UIAlertController(title: "error", message: "請輸入標題欄位", preferredStyle: .alert)
            alertcontroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertcontroller, animated: true, completion: nil)
            return false
        }
    }
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

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
