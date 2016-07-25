//
//  Daily.swift
//
//  Created by dan on 7/21/16
//  Copyright (c) androidadvance. All rights reserved.
//

import Foundation
import ObjectMapper

public class Daily: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDailyDataKey: String = "data"
	internal let kDailySummaryKey: String = "summary"
	internal let kDailyIconKey: String = "icon"


    // MARK: Properties
	public var data: [Data]?
	public var summary: String?
	public var icon: String?



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
		data <- map[kDailyDataKey]
		summary <- map[kDailySummaryKey]
		icon <- map[kDailyIconKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data?.count > 0 {
			var temp: [AnyObject] = []
			for item in data! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kDailyDataKey)
		}
		if summary != nil {
			dictionary.updateValue(summary!, forKey: kDailySummaryKey)
		}
		if icon != nil {
			dictionary.updateValue(icon!, forKey: kDailyIconKey)
		}

        return dictionary
    }

}
