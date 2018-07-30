//
//  Api.swift
//  YBNetworking
//
//  Created by 陈煜彬 on 2018/7/27.
//  Copyright © 2018年 陈煜彬. All rights reserved.
//

import Foundation
import Moya



enum Api {
    
    //不带参数
    case detailsApi
    //带参数  parameters
    case searchApi(parameters: [String: Any])
    
}


// MARK: - 书详情
//https://api.douban.com/v2/book/3145649
// MARK: - 搜索书
//https://api.douban.com/v2/book/search




// MARK: - 求其配置
extension Api:TargetType {
    
    // 服务器地址
    var baseURL: URL {
        return URL.init(string: "https://api.douban.com/v2/book/")!
    }
    
    
    // 请求路径
    var path: String {
        switch self {
        case .detailsApi:
            return "26287173"
        case .searchApi:
            return "search"
//        default:
//            return ""
        }
    }
    
    
    // 请求类型, 暂时用 .get .post
    var method: Moya.Method {
        switch self {
        case .detailsApi:
            return .get
        case .searchApi:
            return .post
//        default:
//            return .post
        }
    }
    
    
    // 单元测试模拟的数据, 只会在单元测试文件中有作用
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    // 是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    
    // 该Api 请求方式
    var task: Task {
        switch self {
        case .detailsApi:
            
            // 不带参数
            return .requestPlain
        case .searchApi(let parameters):
            
            // 带参数
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
//        default:
//            return .requestPlain
        }
    }
    
    
    // 请求头
    var headers: [String : String]? {
        //        return ["Content-Type": "application/x-www-form-urlencoded"]
        return nil
    }
    
    
}
