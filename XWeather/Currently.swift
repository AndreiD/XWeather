//
//  Currently.swift
//
//  Created by dan on 7/21/16
//  Copyright (c) androidadvance. All rights reserved.
//

import Foundation
import ObjectMapper

public class Currently: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kCurrentlyPrecipIntensityKey: String = "precipIntensity"
	internal let kCurrentlyIconKey: String = "icon"
	internal let kCurrentlyTimeKey: String = "time"
	internal let kCurrentlyPrecipProbabilityKey: String = "precipProbability"
	internal let kCurrentlyWindSpeedKey: String = "windSpeed"
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
	public var precipIntensity: Int?
	public var icon: String?
	public var time: Int?
	public var precipProbability: Int?
	public var windSpeed: Float?
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



    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		precipIntensity <- map[kCurrentlyPrecipIntensityKey]
		icon <- map[kCurrentlyIconKey]
		time <- map[kCurrentlyTimeKey]
		precipProbability <- map[kCurrentlyPrecipProbabilityKey]
		windSpeed <- map[kCurrentlyWindSpeedKey]
		summary <- map[kCurrentlySummaryKey]
		apparentTemperature <- map[kCurrentlyApparentTemperatureKey]
		dewPoint <- map[kCurrentlyDewPointKey]
		cloudCover <- map[kCurrentlyCloudCoverKey]
		humidity <- map[kCurrentlyHumidityKey]
		windBearing <- map[kCurrentlyWindBearingKey]
		temperature <- map[kCurrentlyTemperatureKey]
		visibility <- map[kCurrentlyVisibilityKey]
		ozone <- map[kCurrentlyOzoneKey]
		pressure <- map[kCurrentlyPressureKey]

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
