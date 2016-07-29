//
//  Flags.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class Flags: Object, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFlagsIsdStationsKey: String = "isd-stations"
	internal let kFlagsMadisStationsKey: String = "madis-stations"
	internal let kFlagsMetnoLicenseKey: String = "metno-license"
	internal let kFlagsUnitsKey: String = "units"
	internal let kFlagsSourcesKey: String = "sources"


    // MARK: Properties
	public var isdStations: List<Object>?
	public var madisStations: List<Object>?
	public var metnoLicense: String?
	public var units: String?
	public var sources: List<Object>?


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
		isdStations <- map[kFlagsIsdStationsKey]
		madisStations <- map[kFlagsMadisStationsKey]
		metnoLicense <- map[kFlagsMetnoLicenseKey]
		units <- map[kFlagsUnitsKey]
		sources <- map[kFlagsSourcesKey]

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
