//
//  MWHerosManager.swift
//  OutlawsOfTheMarsh
//
//  Created by Tiny on 15/5/13.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit

class MWHerosManager: NSObject {

    
//    var dataPath:String
    
    
    func  fileName() -> String{
        return "HerosData"
    }
    
    let fileManager = NSFileManager.defaultManager();
    
    
    
    
    
    internal  func dataSource() -> NSArray {
        
        var url = NSBundle.mainBundle().URLForResource("HerosData", withExtension: "json")
        
        let data = NSData(contentsOfURL: url!)

//        var data =
//        
//        
        var arr: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
//  
        var newArr = NSMutableArray()
        for dict:NSDictionary in arr as! Array {
            let data = MWHerosData().configDataWithDict(dict)
            newArr.addObject(data)
        }
        return newArr
    }
}
