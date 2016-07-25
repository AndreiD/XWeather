//
//  ViewController.swift
//  XWeather
//
//  Created by dan on 7/21/16.
//  Copyright © 2016 androidadvance. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var imageCurrentConditions: UIImageView!
    @IBOutlet weak var lblCurrentLocation: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var tableFuture: UITableView!
    
    
    var dailyForecast : Daily?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.whiteColor()
        tableFuture.delegate = self
        tableFuture.dataSource = self
        refreshControl.addTarget(self, action: #selector(ViewController.refresh_views), forControlEvents: .ValueChanged)
        tableFuture.addSubview(self.refreshControl)
        refresh_views()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("did receive memory warning...")
    }


    
    func refresh_views(){
        debugPrint("Refreshing views....")
        
        Alamofire.request(ApiRouter.Get("42.69", "23.32")).responseObject(completionHandler: {  (response: Response<WeatherResponse, NSError>) in
            
            self.refreshControl.endRefreshing()
            guard response.result.error == nil else {
                debugPrint(response)
                return
            }
            
            let weatherResponse = response.result.value

            if let currentConditions = weatherResponse?.currently {
                self.lblCurrentTemp.text = String(Int(currentConditions.temperature!)) + "°"
                self.lblHumidity.text = "Humidity \(Int(currentConditions.humidity!))"
                self.lblWind.text = "Wind \(currentConditions.windSpeed!) km/h"
                self.assign_image_to_conditions(self.imageCurrentConditions, conditions_string: currentConditions.icon!)
                
            }
            
            if (weatherResponse?.daily) != nil {
                self.dailyForecast = weatherResponse?.daily
                self.tableFuture.reloadData()
                
            }
            
        })
        

        
    }
 
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
                       
        return UITableViewAutomaticDimension
        
    }
    

 
    func assign_image_to_conditions(imgView: UIImageView!, conditions_string: String){
       
        switch conditions_string {
        case "clear-day":
            imgView.image = UIImage(named: "clear-day.png")
        case "clear-night":
            imgView.image = UIImage(named: "clear-night.png")
        case "rain":
            imgView.image = UIImage(named: "rain.png")
        case "snow":
            imgView.image = UIImage(named: "snow.png")
        case "sleet":
            imgView.image = UIImage(named: "sleet.png")
        case "wind":
            imgView.image = UIImage(named: "wind.png")
        case "fog":
            imgView.image = UIImage(named: "fog.png")
        case "cloudy":
            imgView.image = UIImage(named: "cloudy.png")
        case "partly-cloudy-day", "cloudy-day":
            imgView.image = UIImage(named: "cloudy-day.png")
        case "partly-cloudy-night", "cloudy-night":
            imgView.image = UIImage(named: "cloudy-night.png")
        default:
            debugPrint("Attention! could not find icon for \(conditions_string)")
            imgView.image = UIImage(named: "default.png")
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard dailyForecast?.data != nil else {
            return 0
        }
        return 5 //max 5 days
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PredictionsTableViewCell
        
        guard let dayData = dailyForecast?.data![indexPath.row+1] else {
            debugPrint("no day data available")
            return cell
        }
        
        cell.lblTempMax.text = "\(Int(dayData.temperatureMax!))°"
        cell.lblTempMin.text = "\(Int(dayData.temperatureMin!))°"
        
        cell.lblConditions!.text = dayData.summary
        
        let xtime = dayData.time!
        let date = NSDate(timeIntervalSince1970: Double(xtime))
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE"
        let dateString = dayTimePeriodFormatter.stringFromDate(date)
        
        
        cell.lblDay!.text = dateString
        self.assign_image_to_conditions(cell.imageViewDayConditions, conditions_string: dayData.icon!)
        
        
        
        return cell
    }

}

