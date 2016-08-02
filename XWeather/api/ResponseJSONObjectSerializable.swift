//
// Created by dan on 8/2/16.
// Copyright (c) 2016 androidadvance. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol ResponseJSONObjectSerializable {
    init?(json: SwiftyJSON.JSON)
}