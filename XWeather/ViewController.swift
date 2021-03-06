import UIKit
import Alamofire
import CoreLocation
import RealmSwift
import SwiftyJSON


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    var refreshControl: UIRefreshControl!
    var notificationToken: NotificationToken? = nil

    @IBOutlet weak var imageCurrentConditions: UIImageView!
    @IBOutlet weak var lblCurrentLocation: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWind: UILabel!
    @IBOutlet weak var tableFuture: UITableView!
    @IBOutlet weak var lblTimeAgo: UILabel!
    var lat: String = ""
    var lng: String = ""
    var time_of_update = NSDate()

    let realm = realmAndPath()
    let locationMgr = CLLocationManager()
    var current_location_name: String = ""
    var dailyForecast: Daily!
    var theDatabase = TheDatabase()


    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.whiteColor()
        tableFuture.delegate = self
        tableFuture.dataSource = self
        refreshControl.addTarget(self, action: #selector(ViewController.api_call), forControlEvents: .ValueChanged)
        tableFuture.addSubview(self.refreshControl)
        refreshControl.enabled = false

        locationMgr.delegate = self
        locationMgr.requestWhenInUseAuthorization()
        locationMgr.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationMgr.startUpdatingLocation()

        var _ = NSTimer.scheduledTimerWithTimeInterval(61, target: self, selector: #selector(ViewController.update_time_ago), userInfo: nil, repeats: true)

        let results = realm.objects(TheDatabase.self).filter("id == 0")
        notificationToken = results.addNotificationBlock {
            [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .Initial:
                debugPrint(".Initial triggered...")
                self!.refresh_views()
                break
            case .Update(_, let deletions, let insertions, let modifications):
                debugPrint("notificationToken .Update triggered with: deletions: \(deletions)  insertions: \(insertions)  modifications: \(modifications)")
                self!.refresh_views()
                break
            case .Error(let error):
                fatalError("\(error)")
                break
            }
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("did receive memory warning...")
    }


    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last
        lat = location!.coordinate.latitude.description
        lng = location!.coordinate.longitude.description

        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location!, completionHandler: {
            (placemarks, error) -> Void in

            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]

            if (placeMark != nil) && (placeMark.addressDictionary != nil) {
                let locationName = placeMark.addressDictionary!["Name"]
                self.current_location_name = locationName!.description
                do {
                    try self.realm.write {
                        self.theDatabase.location_name = locationName!.description
                        self.realm.add(self.theDatabase, update: true)
                    }
                } catch let error as NSError {
                    debugPrint(error.description)
                }
                self.locationMgr.stopUpdatingLocation() //no need for another update.
            } else {
                debugPrint("can't get the locationName...")
            }
        })
        api_call()
    }


    func api_call() {

        Alamofire.request(TheAPI.Get(lat, lng)).responseJSON {
            response in

            guard response.result.error == nil else {
                print("error calling GET...")
                print(response.result.error!)
                return
            }

            if self.refreshControl != nil && self.refreshControl!.refreshing {
                self.refreshControl?.endRefreshing()
            }


            guard response.result.error == nil else {
                debugPrint(response.result.error)
                return
            }

            if let value: AnyObject = response.result.value {
                let json = SwiftyJSON.JSON(value)
                self.store_in_db(try! json.rawData())
            }
            self.time_of_update = NSDate()
        }
    }

    func store_in_db(json: NSData) {

        do {
            try self.realm.write {
                self.theDatabase.the_json = json
                self.realm.add(self.theDatabase, update: true)
            }
        } catch let error as NSError {
            debugPrint(error.description)
        }
    }

    func refresh_views() {

        let aux = theDatabase.the_json
        var weatherResponse: WeatherResponse

        do {
            let jsonDict = try NSJSONSerialization.JSONObjectWithData(aux, options: .MutableContainers)
            let json = SwiftyJSON.JSON(jsonDict)
            weatherResponse = WeatherResponse(json: json)
        } catch {
            return
        }

        self.current_location_name = theDatabase.location_name

        if let currentConditions = weatherResponse.currently {
            self.lblCurrentLocation.text = self.current_location_name
            self.lblCurrentTemp.text = String(Int(currentConditions.temperature!)) + "°"
            self.lblHumidity.text = "Humidity \(currentConditions.humidity!)"
            self.lblWind.text = "Wind \(currentConditions.windSpeed!) km/h"
            self.assign_image_to_conditions(self.imageCurrentConditions, conditions_string: currentConditions.icon!)
        }

        if (weatherResponse.daily) != nil {
            self.dailyForecast = weatherResponse.daily!
            self.tableFuture.reloadData()
        }

        self.lblTimeAgo.text = "Just now"

        //make them visible again
        self.lblCurrentLocation.hidden = false
        self.lblCurrentTemp.hidden = false
        self.lblHumidity.hidden = false
        self.lblWind.hidden = false
        self.imageCurrentConditions.hidden = false
        self.lblTimeAgo.hidden = false

    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        return UITableViewAutomaticDimension
    }


    func assign_image_to_conditions(imgView: UIImageView!, conditions_string: String) {

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

        if dailyForecast.data!.count < 1 {
            return cell
        }

        let dayData = dailyForecast.data![indexPath.row + 1]

        cell.lblTempMax.text = "\(Int(dayData.temperatureMax!))°"
        cell.lblTempMin.text = "\(Int(dayData.temperatureMin!))°"

        cell.lblConditions!.text = dayData.summary!

        let xtime = dayData.time!
        let date = NSDate(timeIntervalSince1970: Double(xtime))
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE"
        let dateString = dayTimePeriodFormatter.stringFromDate(date)

        cell.lblDay!.text = dateString
        self.assign_image_to_conditions(cell.imageViewDayConditions, conditions_string: dayData.icon!)

        return cell
    }

    func update_time_ago() {
        self.lblTimeAgo.text = timeAgoSinceDate(self.time_of_update, numericDates: true)
    }

    deinit {
        notificationToken?.stop()
    }
}
