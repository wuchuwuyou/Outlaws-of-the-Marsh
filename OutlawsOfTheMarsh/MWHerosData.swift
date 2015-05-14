//
//  MWHerosData.swift
//  OutlawsOfTheMarsh
//
//  Created by Tiny on 15/5/13.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

import UIKit
//"attack" : "80",
//"attackArea" : "100",
//"defense" : "20",
//"detail" : "郓城县宋家村人氏。为他面黑身矮，人都唤他做黑宋江；在家大孝，为人仗义疏财，所以又称孝义黑三郎。他刀笔精通，更兼爱习枪棒，学得多种武艺。平生爱结实江湖上的英雄好汉，有人前来投奔，无论何人都细心款待，常替人排忧解难，救死扶伤，名震山东、河北，人们将他比作及时雨。所谓山东呼保义，豪杰宋公明。梁山排名第一。",
//"name" : "宋江",
//"nick" : "呼保义",
//"order" : "1",
//"pos" : "总督兵马大元帅",
//"skill" : "风云际会，玄天混元阵",
//"skillExt" : "",
//"star" : "魁",
//"weapon" : "日月星辰旗，混天河洛图"

class MWHerosData: NSObject {
    var attack:String = ""
    var attackArea:String = ""
    var defense:String = ""
    var detail:String = ""
    var name:String = ""
    var nick:String = ""
    var order:String = ""
    var pos:String = ""
    var skill:String = ""
    var skillExt:String = ""
    var star:String = ""
    var weapon:String = ""
    var picName:String = ""
    
    func configDataWithDict(dict:NSDictionary) -> MWHerosData{
        
        attack = dict.objectForKey("attack") as! String
        attackArea = dict.objectForKey("attackArea") as! String
        defense = dict.objectForKey("defense") as! String
        detail = dict.objectForKey("detail") as! String
        name = dict.objectForKey("name") as! String
        nick = dict.objectForKey("nick") as! String
        order = dict.objectForKey("order") as! String
        pos = dict.objectForKey("pos") as! String
        skill = dict.objectForKey("skill") as! String
        skillExt = dict.objectForKey("skillExt") as! String
        star = dict.objectForKey("star") as! String
        weapon = dict.objectForKey("weapon") as! String
        picName = "heros_".stringByAppendingString(dict.objectForKey("order") as! String )
        return  self
    }
}
