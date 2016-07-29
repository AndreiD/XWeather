//
//  Currently.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class Currently: Object, Mappable {

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
	dynamic var precipIntensity: Float = 0.0
	dynamic var icon = "";
	dynamic var time = 0;
	dynamic var precipProbability: Float = 0.0
	dynamic var windSpeed: Float = 0.0
	dynamic var precipType = "";
	dynamic var summary = "";
	dynamic var apparentTemperature: Float = 0.0
	dynamic var dewPoint: Float = 0.0
	dynamic var cloudCover: Float = 0.0
	dynamic var humidity: Float = 0.0
	dynamic var windBearing = 0;
	dynamic var temperature: Float = 0.0
	dynamic var visibility = 0;
	dynamic var ozone: Float = 0.0
	dynamic var pressure: Float = 0.0


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
		precipIntensity <- map[kCurrentlyPrecipIntensityKey]
		icon <- map[kCurrentlyIconKey]
		time <- map[kCurrentlyTimeKey]
		precipProbability <- map[kCurrentlyPrecipProbabilityKey]
		windSpeed <- map[kCurrentlyWindSpeedKey]
		precipType <- map[kCurrentlyPrecipTypeKey]
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

}
