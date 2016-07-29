//
//  Hourly.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public class Hourly: Object, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kHourlyDataKey: String = "data"
	internal let kHourlySummaryKey: String = "summary"
	internal let kHourlyIconKey: String = "icon"


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
		summary <- map[kHourlySummaryKey]
		icon <- map[kHourlyIconKey]
		let info = Mapper<Data>().mapArray(map["data"].currentValue)
		if let info = info {
			data.appendContentsOf(info)
		}
    }



}
