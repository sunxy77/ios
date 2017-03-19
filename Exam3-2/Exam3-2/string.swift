//
//  string.swift
//  Exam3-2
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

import Foundation

extension NSString {
    func split(splitStr: NSString)->[NSString] {
        var ret = [NSString]()
        
        var str = self
        while true {
            
            let range = str.range(of: splitStr as String)
            if range.length == 0 {
                ret.append(str)
                break
            }
            
            let s1 = str.substring(to: range.location)
            ret.append(s1 as NSString)
            
            str = str.substring(from: range.location+1) as NSString
            
            if (str.isEqual(to: "")) {
                break;
            }
        }
        
        return ret
    }
}
