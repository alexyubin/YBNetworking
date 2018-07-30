//
//  SearchModel.swift
//  NetworkDemo
//
//  Created by 陈煜彬 on 2018/7/27.
//  Copyright © 2018年 陈煜彬. All rights reserved.
//

import UIKit
import HandyJSON

class SearchModel: HandyJSON {
    
    var books : [Book]!
    
    required init(){
        
    }
}

class Book: HandyJSON {
    
    
    var title : String!
    var author_intro : String!
    
    required init(){
        
    }
}

