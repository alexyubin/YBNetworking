//
//  ApiManager.swift
//  YBNetworking
//
//  Created by 陈煜彬 on 2018/7/27.
//  Copyright © 2018年 陈煜彬. All rights reserved.
//


import Foundation
import Moya

// 超时时长
private var requestTimeOut:Double = 5.0
// 成功回调
typealias success = ((String) -> (Void))
// 失败回调
typealias failed = ((String) -> (Void))
// 网络错误回调
typealias error = (() -> (Void))


// 网络请求的基本设置 (可以对指定api进行设置)
private let myEndpointClosure = { (target: Api) -> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path
    var task = target.task
    
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: { .networkResponse(200, target.sampleData) },
        method: target.method,
        task: task,
        httpHeaderFields: target.headers
    )
    // 可以单独设置每条请求的超时时间
    //    requestTimeOut = 4.0
    //    switch target {
    //    case .loginApi:
    //        return endpoint
    //    default:
    return endpoint
    
}

///网络请求的设置
private let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
    do {
        var request = try endpoint.urlRequest()
        //设置请求时长
        request.timeoutInterval = requestTimeOut
        // 打印请求参数
        if let requestData = request.httpBody {
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        done(.success(request))
    } catch {
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

// 网络请求初始化
let Provider = MoyaProvider<Api>(endpointClosure: myEndpointClosure, requestClosure: requestClosure,  trackInflights: false)


func YBNetWorkRequest(_ target: Api, completion: @escaping success , failed:failed?) {
    YBNetWorkRequest(target, completion: completion, failed: failed, errorResult: nil)
}

func YBNetWorkRequest(_ target: Api, completion: @escaping success , failed:failed?, errorResult:error?) {
    
    Provider.request(target) { (result) in
        switch result {
        case let .success(response):
            completion(String(data: response.data, encoding: String.Encoding.utf8)!)
        case  .failure:
            print("请求失败\n")
            if errorResult != nil {
                errorResult!()
            }
        }
    }
}

