//
//  TheDatabase.swift
//
//  Created by dan on 7/29/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import RealmSwift

public class TheDatabase: Object {



	dynamic var the_json = NSData()
	dynamic var location_name = ""


	dynamic var id = 0

	override public static func primaryKey() -> String? {
		return "id"
	}


}
