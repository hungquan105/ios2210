//
//  Request.swift
//  Buoi29
//
//  Created by Quân on 12/26/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import Foundation
import Alamofire

typealias CompleteHandleJSON = (_ isSuccess: Bool, _ json: Any?, _ error: Error?)->()

struct RequestService {
    
    static let shared = RequestService()
    
    func request<T:Codable>(_ url:String, _ method:HTTPMethod, _ parameters:[String:String],_ encoder:ParameterEncoder , _ headers:HTTPHeaders?, _ objectType:T.Type, _ complete:@escaping CompleteHandleJSON){
        AF.request(url, method: method, parameters: parameters, encoder: encoder, headers: headers, interceptor: nil).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONDecoder.init().decode(objectType, from: data!)
                    complete(true,json,nil)
                } catch {
                    complete(false,data,nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                complete(false,nil,error)
            }
        }
        
    }
    
}


