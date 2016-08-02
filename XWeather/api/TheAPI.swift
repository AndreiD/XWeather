
import Foundation
import Alamofire

public enum TheAPI: URLRequestConvertible {
    static let API_KEY = "c412cabc1f292da748e330f79a7c140d"
    static var baseURLString = "https://api.forecast.io/forecast/"+API_KEY+"/" //42.69,23.32?units=si"


    case GetAtPath(String) // GET //we have full path
    case Get(String,String) // GET //42.69,23.32?units=si"


    public var URLRequest: NSMutableURLRequest {
        let result: (path: String, method: Alamofire.Method, parameters: [String: AnyObject]) = {
            switch self {
            case .Get(let lat, let lng):
                let params = [ "units" : "si" ]
                return ("\(lat),\(lng)", .GET, params)
            case .GetAtPath(let path):
                return (path, .GET, [String: AnyObject]())
            }
        }()

        let URL = NSURL(string: TheAPI.baseURLString)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(result.path))
        URLRequest.HTTPMethod = result.method.rawValue
        //URLRequest.setValue(ImaggaRouter.authenticationToken, forHTTPHeaderField: "Authorization")
        URLRequest.timeoutInterval = NSTimeInterval(5 * 1000)

        let encoding = Alamofire.ParameterEncoding.URL

        return encoding.encode(URLRequest, parameters: result.parameters).0
    }

}
