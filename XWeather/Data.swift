//
//  Data.swift
//
//  Created by dan on 7/21/16
//  Copyright (c) androidadvance. All rights reserved.
//

import Foundation
import ObjectMapper

public class Data: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataPrecipIntensityKey: String = "precipIntensity"
	internal let kDataTemperatureMinKey: String = "temperatureMin"
	internal let kDataTimeKey: String = "time"
	internal let kDataPrecipProbabilityKey: String = "precipProbability"
	internal let kDataPrecipTypeKey: String = "precipType"
	internal let kDataApparentTemperatureMaxTimeKey: String = "apparentTemperatureMaxTime"
	internal let kDataPrecipIntensityMaxTimeKey: String = "precipIntensityMaxTime"
	internal let kDataSummaryKey: String = "summary"
	internal let kDataTemperatureMinTimeKey: String = "temperatureMinTime"
	internal let kDataApparentTemperatureMinTimeKey: String = "apparentTemperatureMinTime"
	internal let kDataTemperatureMaxTimeKey: String = "temperatureMaxTime"
	internal let kDataPrecipIntensityMaxKey: String = "precipIntensityMax"
	internal let kDataMoonPhaseKey: String = "moonPhase"
	internal let kDataIconKey: String = "icon"
	internal let kDataApparentTemperatureMinKey: String = "apparentTemperatureMin"
	internal let kDataWindSpeedKey: String = "windSpeed"
	internal let kDataTemperatureMaxKey: String = "temperatureMax"
	internal let kDataDewPointKey: String = "dewPoint"
	internal let kDataSunsetTimeKey: String = "sunsetTime"
	internal let kDataCloudCoverKey: String = "cloudCover"
	internal let kDataHumidityKey: String = "humidity"
	internal let kDataApparentTemperatureMaxKey: String = "apparentTemperatureMax"
	internal let kDataOzoneKey: String = "ozone"
	internal let kDataPressureKey: String = "pressure"
	internal let kDataVisibilityKey: String = "visibility"
	internal let kDataWindBearingKey: String = "windBearing"
	internal let kDataSunriseTimeKey: String = "sunriseTime"


    // MARK: Properties
	public var precipIntensity: Float?
	public var temperatureMin: Float?
	public var time: Int?
	public var precipProbability: Float?
	public var precipType: String?
	public var apparentTemperatureMaxTime: Int?
	public var precipIntensityMaxTime: Int?
	public var summary: String?
	public var temperatureMinTime: Int?
	public var apparentTemperatureMinTime: Int?
	public var temperatureMaxTime: Int?
	public var precipIntensityMax: Float?
	public var moonPhase: Float?
	public var icon: String?
	public var apparentTemperatureMin: Float?
	public var windSpeed: Float?
	public var temperatureMax: Float?
	public var dewPoint: Float?
	public var sunsetTime: Int?
	public var cloudCover: Float?
	public var humidity: Float?
	public var apparentTemperatureMax: Float?
	public var ozone: Float?
	public var pressure: Float?
	public var visibility: Float?
	public var windBearing: Int?
	public var sunriseTime: Int?



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
		precipIntensity <- map[kDataPrecipIntensityKey]
		temperatureMin <- map[kDataTemperatureMinKey]
		time <- map[kDataTimeKey]
		precipProbability <- map[kDataPrecipProbabilityKey]
		precipType <- map[kDataPrecipTypeKey]
		apparentTemperatureMaxTime <- map[kDataApparentTemperatureMaxTimeKey]
		precipIntensityMaxTime <- map[kDataPrecipIntensityMaxTimeKey]
		summary <- map[kDataSummaryKey]
		temperatureMinTime <- map[kDataTemperatureMinTimeKey]
		apparentTemperatureMinTime <- map[kDataApparentTemperatureMinTimeKey]
		temperatureMaxTime <- map[kDataTemperatureMaxTimeKey]
		precipIntensityMax <- map[kDataPrecipIntensityMaxKey]
		moonPhase <- map[kDataMoonPhaseKey]
		icon <- map[kDataIconKey]
		apparentTemperatureMin <- map[kDataApparentTemperatureMinKey]
		windSpeed <- map[kDataWindSpeedKey]
		temperatureMax <- map[kDataTemperatureMaxKey]
		dewPoint <- map[kDataDewPointKey]
		sunsetTime <- map[kDataSunsetTimeKey]
		cloudCover <- map[kDataCloudCoverKey]
		humidity <- map[kDataHumidityKey]
		apparentTemperatureMax <- map[kDataApparentTemperatureMaxKey]
		ozone <- map[kDataOzoneKey]
		pressure <- map[kDataPressureKey]
		visibility <- map[kDataVisibilityKey]
		windBearing <- map[kDataWindBearingKey]
		sunriseTime <- map[kDataSunriseTimeKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if precipIntensity != nil {
			dictionary.updateValue(precipIntensity!, forKey: kDataPrecipIntensityKey)
		}
		if temperatureMin != nil {
			dictionary.updateValue(temperatureMin!, forKey: kDataTemperatureMinKey)
		}
		if time != nil {
			dictionary.updateValue(time!, forKey: kDataTimeKey)
		}
		if precipProbability != nil {
			dictionary.updateValue(precipProbability!, forKey: kDataPrecipProbabilityKey)
		}
		if precipType != nil {
			dictionary.updateValue(precipType!, forKey: kDataPrecipTypeKey)
		}
		if apparentTemperatureMaxTime != nil {
			dictionary.updateValue(apparentTemperatureMaxTime!, forKey: kDataApparentTemperatureMaxTimeKey)
		}
		if precipIntensityMaxTime != nil {
			dictionary.updateValue(precipIntensityMaxTime!, forKey: kDataPrecipIntensityMaxTimeKey)
		}
		if summary != nil {
			dictionary.updateValue(summary!, forKey: kDataSummaryKey)
		}
		if temperatureMinTime != nil {
			dictionary.updateValue(temperatureMinTime!, forKey: kDataTemperatureMinTimeKey)
		}
		if apparentTemperatureMinTime != nil {
			dictionary.updateValue(apparentTemperatureMinTime!, forKey: kDataApparentTemperatureMinTimeKey)
		}
		if temperatureMaxTime != nil {
			dictionary.updateValue(temperatureMaxTime!, forKey: kDataTemperatureMaxTimeKey)
		}
		if precipIntensityMax != nil {
			dictionary.updateValue(precipIntensityMax!, forKey: kDataPrecipIntensityMaxKey)
		}
		if moonPhase != nil {
			dictionary.updateValue(moonPhase!, forKey: kDataMoonPhaseKey)
		}
		if icon != nil {
			dictionary.updateValue(icon!, forKey: kDataIconKey)
		}
		if apparentTemperatureMin != nil {
			dictionary.updateValue(apparentTemperatureMin!, forKey: kDataApparentTemperatureMinKey)
		}
		if windSpeed != nil {
			dictionary.updateValue(windSpeed!, forKey: kDataWindSpeedKey)
		}
		if temperatureMax != nil {
			dictionary.updateValue(temperatureMax!, forKey: kDataTemperatureMaxKey)
		}
		if dewPoint != nil {
			dictionary.updateValue(dewPoint!, forKey: kDataDewPointKey)
		}
		if sunsetTime != nil {
			dictionary.updateValue(sunsetTime!, forKey: kDataSunsetTimeKey)
		}
		if cloudCover != nil {
			dictionary.updateValue(cloudCover!, forKey: kDataCloudCoverKey)
		}
		if humidity != nil {
			dictionary.updateValue(humidity!, forKey: kDataHumidityKey)
		}
		if apparentTemperatureMax != nil {
			dictionary.updateValue(apparentTemperatureMax!, forKey: kDataApparentTemperatureMaxKey)
		}
		if ozone != nil {
			dictionary.updateValue(ozone!, forKey: kDataOzoneKey)
		}
		if pressure != nil {
			dictionary.updateValue(pressure!, forKey: kDataPressureKey)
		}
		if visibility != nil {
			dictionary.updateValue(visibility!, forKey: kDataVisibilityKey)
		}
		if windBearing != nil {
			dictionary.updateValue(windBearing!, forKey: kDataWindBearingKey)
		}
		if sunriseTime != nil {
			dictionary.updateValue(sunriseTime!, forKey: kDataSunriseTimeKey)
		}

        return dictionary
    }

}
