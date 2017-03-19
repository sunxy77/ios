//
//  main.swift
//  Exam3-3
//
//  Created by 孙晓晔 on 2017/3/19.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

import Foundation

var g1 = girlFriend(name: "张三", age: 18)

var sur = ["孙", "王", "李", "吴", "陈", "刘"]
var name = "翼璟克城燕玲语晨小雪敏娟雪婷建琴凤英红燕"

var len = name.lengthOfBytes(using: String.Encoding.utf8)

let arr = name.characters

var girls = [girlFriend]()

for i in 0..<100 {
    var a = Int(arc4random() % 6)
    var pos = Int(arc4random() % 20)
    var b = arr.index(arr.startIndex, offsetBy: pos)
    
    pos = Int(arc4random() % 20)
    var c = arr.index(arr.startIndex, offsetBy: pos)
    
    var s = "\(sur[a])\(arr[b])\(arr[c])"
    
    var age = Int(arc4random() % 40)
    if (age < 16) {
        age += 16
    }
    if (age > 33) {
        age -= 10
    }
    
    var g1 = girlFriend(name: s, age: age)
    
    girls.append(g1)
}

for i in 0...girls.count-1 {
    print("序号：\(i) \(girls[i])")
}

