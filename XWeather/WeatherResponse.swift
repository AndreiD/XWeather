//
//  WeatherResponse.swift
//
//  Created by dan on 7/21/16
//  Copyright (c) androidadvance. All rights reserved.
//

import Foundation
import ObjectMapper

public class WeatherResponse: Mappable {

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
		hourly <- map[kWeatherResponseHourlyKey]
		daily <- map[kWeatherResponseDailyKey]
		longitude <- map[kWeatherResponseLongitudeKey]
		latitude <- map[kWeatherResponseLatitudeKey]
		flags <- map[kWeatherResponseFlagsKey]
		offset <- map[kWeatherResponseOffsetKey]
		currently <- map[kWeatherResponseCurrentlyKey]
		timezone <- map[kWeatherResponseTimezoneKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if hourly != nil {
			dictionary.updateValue(hourly!.dictionaryRepresentation(), forKey: kWeatherResponseHourlyKey)
		}
		if daily != nil {
			dictionary.updateValue(daily!.dictionaryRepresentation(), forKey: kWeatherResponseDailyKey)
		}
		if longitude != nil {
			dictionary.updateValue(longitude!, forKey: kWeatherResponseLongitudeKey)
		}
		if latitude != nil {
			dictionary.updateValue(latitude!, forKey: kWeatherResponseLatitudeKey)
		}
		if flags != nil {
			dictionary.updateValue(flags!.dictionaryRepresentation(), forKey: kWeatherResponseFlagsKey)
		}
		if offset != nil {
			dictionary.updateValue(offset!, forKey: kWeatherResponseOffsetKey)
		}
		if currently != nil {
			dictionary.updateValue(currently!.dictionaryRepresentation(), forKey: kWeatherResponseCurrentlyKey)
		}
		if timezone != nil {
			dictionary.updateValue(timezone!, forKey: kWeatherResponseTimezoneKey)
		}

        return dictionary
    }

}
