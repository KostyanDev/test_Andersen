//
//  ADTableViewController.swift
//  test_Andersen
//
//  Created by Константин Овчаренко on 19.03.17.
//  Copyright © 2017 Константин Овчаренко. All rights reserved.
//

import UIKit
import SwiftyJSON

class ADTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

       // let file = "Profil.json"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       return self.myDataSource.count
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ADTableViewControllerCell

      

        
       cell.ADName.text = [indexPath.row]

        return cell
    }
   
    let name:String = ""
    let surname:String = ""
    var myDataSource: [(name:String, age: String, surname: String)] = []() {
        didSet{ self.reloadData()}
    }
    
    func loadJson() -> (name:String,surname:String) {
        
        if let path = Bundle.main.url(forResource: "profil", withExtension: "json") {
            
            
            do {
                let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? NSDictionary {
                        if let personArray = jsonResult.value(forKey: "person") as? NSArray {
                            for (_, element) in personArray.enumerated() {
                                if let element = element as? NSDictionary {
                                    let name = element.value(forKey: "name") as! String
                                    let age = element.value(forKey: "age") as! String
                                    let surname = element.value(forKey: "surname") as! String
                                    myDataSource.append((name,age,surname))
                                    print("Name: \(name), surmane: \(surname), age: \(age)")
                                    
                                    
                                }
                            }
                        }
                    }
                } catch let error as
                    NSError {
                        print("Error: \(error)")
                }
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }
        
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
