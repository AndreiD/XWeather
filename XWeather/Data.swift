//
//  Data.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class Data: Object, Mappable {

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
	dynamic var precipIntensity: Float = 0.0
	dynamic var temperatureMin: Float = 0.0
	dynamic var time = 0;
	dynamic var precipProbability: Float = 0.0
	dynamic var precipType = "";
	dynamic var apparentTemperatureMaxTime = 0;
	dynamic var precipIntensityMaxTime = 0;
	dynamic var summary = "";
	dynamic var temperatureMinTime = 0;
	dynamic var apparentTemperatureMinTime = 0;
	dynamic var temperatureMaxTime = 0;
	dynamic var precipIntensityMax: Float = 0.0
	dynamic var moonPhase: Float = 0.0
	dynamic var icon = "";
	dynamic var apparentTemperatureMin: Float = 0.0
	dynamic var windSpeed: Float = 0.0
	dynamic var temperatureMax = 0;
	dynamic var dewPoint: Float = 0.0
	dynamic var sunsetTime = 0;
	dynamic var cloudCover: Float = 0.0
	dynamic var humidity: Float = 0.0
	dynamic var apparentTemperatureMax: Float = 0.0
	dynamic var ozone: Float = 0.0
	dynamic var pressure: Float = 0.0
	dynamic var visibility: Float = 0.0
	dynamic var windBearing = 0;
	dynamic var sunriseTime = 0;



	dynamic var id = 0

	override public static func primaryKey() -> String? {
		return "id"
	}


	// MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
//    required public init?(_ map: Map){
//
//    }

	required public convenience init?(_ map: Map) {
		self.init()
	}

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
	public func mapping(map: Map) {
		id    <- map["id"]
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



}
