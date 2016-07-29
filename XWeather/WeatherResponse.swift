//
//  WeatherResponse.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class WeatherResponse: Object, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kWeatherResponseHourlyKey: String = "hourly"
	internal let kWeatherResponseDailyKey: String = "daily"
	internal let kWeatherResponseLongitudeKey: String = "longitude"
	internal let kWeatherResponseLatitudeKey: String = "latitude"
	internal let kWeatherResponseFlagsKey: String = "flags"
	internal let kWeatherResponseOffsetKey: String = "offset"
	internal let kWeatherResponseCurrentlyKey: String = "currently"
	internal let kWeatherResponseTimezoneKey: String = "timezone"


    // MARK: Properties
	public var hourly: Hourly?
	public var daily: Daily?
	public var longitude: Float?
	public var latitude: Float?
	public var flags: Flags?
	public var offset: Int?
	public var currently: Currently?
	public var timezone: String?


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
		hourly <- map[kWeatherResponseHourlyKey]
		daily <- map[kWeatherResponseDailyKey]
		longitude <- map[kWeatherResponseLongitudeKey]
		latitude <- map[kWeatherResponseLatitudeKey]
		flags <- map[kWeatherResponseFlagsKey]
		offset <- map[kWeatherResponseOffsetKey]
		currently <- map[kWeatherResponseCurrentlyKey]
		timezone <- map[kWeatherResponseTimezoneKey]

    }


}
