//
//  Daily.swift
//
//  Created by dan on 8/2/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Daily: ResponseJSONObjectSerializable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDailyDataKey: String = "data"
	internal let kDailySummaryKey: String = "summary"
	internal let kDailyIconKey: String = "icon"


    // MARK: Properties
	public var data: [Data]?
	public var summary: String?
	public var icon: String?


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
    public required  init(json: JSON) {
		data = []
		if let items = json[kDailyDataKey].array {
			for item in items {
				data?.append(Data(json: item))
			}
		} else {
			data = nil
		}
		summary = json[kDailySummaryKey].string
		icon = json[kDailyIconKey].string

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
