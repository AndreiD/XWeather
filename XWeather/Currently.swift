//
//  Currently.swift
//
//  Created by dan on 8/2/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Currently: ResponseJSONObjectSerializable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCurrentlyPrecipIntensityKey: String = "precipIntensity"
	internal let kCurrentlyIconKey: String = "icon"
	internal let kCurrentlyTimeKey: String = "time"
	internal let kCurrentlyPrecipProbabilityKey: String = "precipProbability"
	internal let kCurrentlyWindSpeedKey: String = "windSpeed"
	internal let kCurrentlyPrecipTypeKey: String = "precipType"
	internal let kCurrentlySummaryKey: String = "summary"
	internal let kCurrentlyApparentTemperatureKey: String = "apparentTemperature"
	internal let kCurrentlyDewPointKey: String = "dewPoint"
	internal let kCurrentlyCloudCoverKey: String = "cloudCover"
	internal let kCurrentlyHumidityKey: String = "humidity"
	internal let kCurrentlyWindBearingKey: String = "windBearing"
	internal let kCurrentlyTemperatureKey: String = "temperature"
	internal let kCurrentlyVisibilityKey: String = "visibility"
	internal let kCurrentlyOzoneKey: String = "ozone"
	internal let kCurrentlyPressureKey: String = "pressure"


    // MARK: Properties
	public var precipIntensity: Float?
	public var icon: String?
	public var time: Int?
	public var precipProbability: Float?
	public var windSpeed: Float?
	public var precipType: String?
	public var summary: String?
	public var apparentTemperature: Float?
	public var dewPoint: Float?
	public var cloudCover: Float?
	public var humidity: Float?
	public var windBearing: Int?
	public var temperature: Float?
	public var visibility: Float?
	public var ozone: Float?
	public var pressure: Float?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public required init(json: JSON) {
		precipIntensity = json[kCurrentlyPrecipIntensityKey].float
		icon = json[kCurrentlyIconKey].string
		time = json[kCurrentlyTimeKey].int
		precipProbability = json[kCurrentlyPrecipProbabilityKey].float
		windSpeed = json[kCurrentlyWindSpeedKey].float
		precipType = json[kCurrentlyPrecipTypeKey].string
		summary = json[kCurrentlySummaryKey].string
		apparentTemperature = json[kCurrentlyApparentTemperatureKey].float
		dewPoint = json[kCurrentlyDewPointKey].float
		cloudCover = json[kCurrentlyCloudCoverKey].float
		humidity = json[kCurrentlyHumidityKey].float
		windBearing = json[kCurrentlyWindBearingKey].int
		temperature = json[kCurrentlyTemperatureKey].float
		visibility = json[kCurrentlyVisibilityKey].float
		ozone = json[kCurrentlyOzoneKey].float
		pressure = json[kCurrentlyPressureKey].float

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if precipIntensity != nil {
			dictionary.updateValue(precipIntensity!, forKey: kCurrentlyPrecipIntensityKey)
		}
		if icon != nil {
			dictionary.updateValue(icon!, forKey: kCurrentlyIconKey)
		}
		if time != nil {
			dictionary.updateValue(time!, forKey: kCurrentlyTimeKey)
		}
		if precipProbability != nil {
			dictionary.updateValue(precipProbability!, forKey: kCurrentlyPrecipProbabilityKey)
		}
		if windSpeed != nil {
			dictionary.updateValue(windSpeed!, forKey: kCurrentlyWindSpeedKey)
		}
		if precipType != nil {
			dictionary.updateValue(precipType!, forKey: kCurrentlyPrecipTypeKey)
		}
		if summary != nil {
			dictionary.updateValue(summary!, forKey: kCurrentlySummaryKey)
		}
		if apparentTemperature != nil {
			dictionary.updateValue(apparentTemperature!, forKey: kCurrentlyApparentTemperatureKey)
		}
		if dewPoint != nil {
			dictionary.updateValue(dewPoint!, forKey: kCurrentlyDewPointKey)
		}
		if cloudCover != nil {
			dictionary.updateValue(cloudCover!, forKey: kCurrentlyCloudCoverKey)
		}
		if humidity != nil {
			dictionary.updateValue(humidity!, forKey: kCurrentlyHumidityKey)
		}
		if windBearing != nil {
			dictionary.updateValue(windBearing!, forKey: kCurrentlyWindBearingKey)
		}
		if temperature != nil {
			dictionary.updateValue(temperature!, forKey: kCurrentlyTemperatureKey)
		}
		if visibility != nil {
			dictionary.updateValue(visibility!, forKey: kCurrentlyVisibilityKey)
		}
		if ozone != nil {
			dictionary.updateValue(ozone!, forKey: kCurrentlyOzoneKey)
		}
		if pressure != nil {
			dictionary.updateValue(pressure!, forKey: kCurrentlyPressureKey)
		}

        return dictionary
    }

}
