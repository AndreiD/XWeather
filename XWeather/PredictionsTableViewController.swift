//
//  PredictionsTableViewController.swift
//  XWeather
//
//  Created by dan on 7/22/16.
//  Copyright © 2016 androidadvance. All rights reserved.
//

import UIKit

class PredictionsTableViewController: UITableViewController {
           
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PredictionsTableViewCell
        
        cell.lblDay.text = "FUCK YOU!"
        cell.imageViewDayConditions.image = UIImage(named: "clear-night")!
        cell.lblConditions.text = "mothehrfucker"
        
//       let entry = data.places[indexPath.row]
//       let image = UIImage(named: entry.filename)
//       cell.bkImageView.image = image
//       cell.headingLabel.text = entry.heading
    return cell
    }
    
    
    
}
