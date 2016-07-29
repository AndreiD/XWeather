//
// Created by dan on 7/29/16.
// Copyright (c) 2016 androidadvance. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

extension Request {

    internal static func newError(code: Error.Code, failureReason: String) -> NSError {
        let errorDomain = "com.alamofireobjectmapper.error"

        let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        let returnError = NSError(domain: errorDomain, code: code.rawValue, userInfo: userInfo)

        return returnError
    }

    public static func ObjectMapperSerializer<T: Mappable>(keyPath: String?, mapToObject object: T? = nil, context: MapContext? = nil) -> ResponseSerializer<T, NSError> {
        return ResponseSerializer { request, response, data, error in
            guard error == nil else {
                return .Failure(error!)
            }

            guard let _ = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = newError(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }

            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)

            let JSONToMap: AnyObject?
            if let keyPath = keyPath where keyPath.isEmpty == false {
                JSONToMap = result.value?.valueForKeyPath(keyPath)
            } else {
                JSONToMap = result.value
            }

            if let object = object {
                Mapper<T>().map(JSONToMap, toObject: object)
                return .Success(object)
            } else if let parsedObject = Mapper<T>(context: context).map(JSONToMap){
                return .Success(parsedObject)
            }

            let failureReason = "ObjectMapper failed to serialize response."
            let error = newError(.DataSerializationFailed, failureReason: failureReason)
            return .Failure(error)
        }
    }

    /**
     Adds a handler to be called once the request has finished.

     - parameter queue:             The queue on which the completion handler is dispatched.
     - parameter keyPath:           The key path where object mapping should be performed
     - parameter object:            An object to perform the mapping on to
     - parameter completionHandler: A closure to be executed once the request has finished and the data has been mapped by ObjectMapper.

     - returns: The request.
     */

    public func responseObject<T: Mappable>(queue queue: dispatch_queue_t? = nil, keyPath: String? = nil, mapToObject object: T? = nil, context: MapContext? = nil, completionHandler: Response<T, NSError> -> Void) -> Self {
        return response(queue: queue, responseSerializer: Request.ObjectMapperSerializer(keyPath, mapToObject: object, context: context), completionHandler: completionHandler)
    }

    public static func ObjectMapperArraySerializer<T: Mappable>(keyPath: String?, context: MapContext? = nil) -> ResponseSerializer<[T], NSError> {
        return ResponseSerializer { request, response, data, error in
            guard error == nil else {
                return .Failure(error!)
            }

            guard let _ = data else {
                let failureReason = "Data could not be serialized. Input data was nil."
                let error = newError(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }

            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)

            let JSONToMap: AnyObject?
            if let keyPath = keyPath where keyPath.isEmpty == false {
                JSONToMap = result.value?.valueForKeyPath(keyPath)
            } else {
                JSONToMap = result.value
            }

            if let parsedObject = Mapper<T>(context: context).mapArray(JSONToMap){
                return .Success(parsedObject)
            }

            let failureReason = "ObjectMapper failed to serialize response."
            let error = newError(.DataSerializationFailed, failureReason: failureReason)
            return .Failure(error)
        }
    }

    /**
     Adds a handler to be called once the request has finished.

     - parameter queue: The queue on which the completion handler is dispatched.
     - parameter keyPath: The key path where object mapping should be performed
     - parameter completionHandler: A closure to be executed once the request has finished and the data has been mapped by ObjectMapper.

     - returns: The request.
    */
    public func responseArray<T: Mappable>(queue queue: dispatch_queue_t? = nil, keyPath: String? = nil, context: MapContext? = nil, completionHandler: Response<[T], NSError> -> Void) -> Self {
        return response(queue: queue, responseSerializer: Request.ObjectMapperArraySerializer(keyPath, context: context), completionHandler: completionHandler)
    }
}