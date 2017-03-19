//
//  getFriend.swift
//  Exam3-1
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

import Foundation

public class girlFriend:NSObject {
    
    private var _name:String
    private var _age:Int
    
    init(name:String, age:Int) {
        
        _name = name
        _age = age
    }
    
    // 约会
    public func engagement() {
        
    }
    
    public override var description:String {
        get {
            return "名字：\(_name) 年龄：\(_age)"
        }
        
    }
}
