//
//  Daily.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


public class Daily: Object, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDailyDataKey: String = "data"
	internal let kDailySummaryKey: String = "summary"
	internal let kDailyIconKey: String = "icon"


    // MARK: Properties
	var data = List<Data>()
	public var summary: String?
	public var icon: String?

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


		let information = Mapper<Data>().mapArray(map["data"].currentValue)
		if let information = information {
			data.appendContentsOf(information)
		}

		summary <- map[kDailySummaryKey]
		icon <- map[kDailyIconKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data.count > 0 {
			var temp: [AnyObject] = []
			for item in data {
				temp.append(item.description)
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
