//
//  WeatherResponse.swift
//
//  Created by dan on 8/2/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class WeatherResponse: ResponseJSONObjectSerializable {

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
		hourly = Hourly(json: json[kWeatherResponseHourlyKey])
		daily = Daily(json: json[kWeatherResponseDailyKey])
		longitude = json[kWeatherResponseLongitudeKey].float
		latitude = json[kWeatherResponseLatitudeKey].float
		flags = Flags(json: json[kWeatherResponseFlagsKey])
		offset = json[kWeatherResponseOffsetKey].int
		currently = Currently(json: json[kWeatherResponseCurrentlyKey])
		timezone = json[kWeatherResponseTimezoneKey].string

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
