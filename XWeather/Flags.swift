//
//  Flags.swift
//
//  Created by dan on 8/2/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Flags: ResponseJSONObjectSerializable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFlagsIsdStationsKey: String = "isd-stations"
	internal let kFlagsMadisStationsKey: String = "madis-stations"
	internal let kFlagsMetnoLicenseKey: String = "metno-license"
	internal let kFlagsUnitsKey: String = "units"
	internal let kFlagsSourcesKey: String = "sources"


    // MARK: Properties
	public var isdStations: [String]?
	public var madisStations: [String]?
	public var metnoLicense: String?
	public var units: String?
	public var sources: [String]?


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
		isdStations = []
		if let items = json[kFlagsIsdStationsKey].array {
			for item in items {
				if let tempValue = item.string {
				isdStations?.append(tempValue)
				}
			}
		} else {
			isdStations = nil
		}
		madisStations = []
		if let items = json[kFlagsMadisStationsKey].array {
			for item in items {
				if let tempValue = item.string {
				madisStations?.append(tempValue)
				}
			}
		} else {
			madisStations = nil
		}
		metnoLicense = json[kFlagsMetnoLicenseKey].string
		units = json[kFlagsUnitsKey].string
		sources = []
		if let items = json[kFlagsSourcesKey].array {
			for item in items {
				if let tempValue = item.string {
				sources?.append(tempValue)
				}
			}
		} else {
			sources = nil
		}

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if isdStations?.count > 0 {
			dictionary.updateValue(isdStations!, forKey: kFlagsIsdStationsKey)
		}
		if madisStations?.count > 0 {
			dictionary.updateValue(madisStations!, forKey: kFlagsMadisStationsKey)
		}
		if metnoLicense != nil {
			dictionary.updateValue(metnoLicense!, forKey: kFlagsMetnoLicenseKey)
		}
		if units != nil {
			dictionary.updateValue(units!, forKey: kFlagsUnitsKey)
		}
		if sources?.count > 0 {
			dictionary.updateValue(sources!, forKey: kFlagsSourcesKey)
		}

        return dictionary
    }

}
