//
//  PredictionsTableViewCell.swift
//  XWeather
//
//  Created by dan on 7/22/16.
//  Copyright © 2016 androidadvance. All rights reserved.
//

import UIKit

class PredictionsTableViewCell: UITableViewCell {
   
    
    
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var imageViewDayConditions: UIImageView!
    @IBOutlet weak var lblConditions: UILabel!
    @IBOutlet weak var lblTempMax: UILabel!
    @IBOutlet weak var lblTempMin: UILabel!
    
    
   override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}