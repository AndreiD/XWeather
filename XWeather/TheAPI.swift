//
//  TheAPI.swift
//  XWeather
//
//  Created by dan on 7/21/16.
//  Copyright © 2016 androidadvance. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    static let API_KEY = "c412cabc1f292da748e330f79a7c140d"
    static var baseURLString = "https://api.forecast.io/forecast/"+API_KEY+"/" //42.69,23.32?units=si"
    
    case Get(String,String)
   
    
    var URLRequest: NSMutableURLRequest {
        let result: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .Get(let lat, let lng):
                return ("\(lat),\(lng)", ["units": "si"])
            }
        }()


        let URL = NSURL(string: ApiRouter.baseURLString)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))

        //URLRequest.HTTPMethod = result.parameters.description.
        //URLRequest.setValue(ImaggaRouter.authenticationToken, forHTTPHeaderField: "Authorization")
        URLRequest.timeoutInterval = NSTimeInterval(5 * 1000)

        let encoding = Alamofire.ParameterEncoding.URL

        return encoding.encode(URLRequest, parameters: result.parameters).0

    }
}