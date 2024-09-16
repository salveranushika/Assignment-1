//
//  TableViewController.swift
//  Assignment 1
//
//  Created by Salver Anushika on 9/11/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    lazy var imageModel: ImageModel = {
        return ImageModel.sharedInstance()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // Use the model's numberOfImages() method instead of accessing imageNames directly
            return self.imageModel.numberOfImages()
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageNameCell", for: indexPath)
            
            // Use the model's getImageName(for:) method to retrieve the image name by index
            let name = self.imageModel.getImageName(for: indexPath.row)
            cell.textLabel!.text = name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell", for: indexPath)
            
            // Configure the cell...
            cell.textLabel?.text = "All Images"
            cell.detailTextLabel?.text = "Summary"
            
            return cell
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController,
           let cell = sender as? UITableViewCell,
           let name = cell.textLabel?.text {
            vc.displayImageName = name
        }
    }
}
