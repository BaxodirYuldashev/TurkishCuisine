//
//  Model.swift
//  TurkishKitchen
//
//  Created by macbook on 4/11/22.
//  Copyright © 2022 macbook. All rights reserved.
//

import UIKit

class Ovqat {
    
    var name: String?
    var url: String?
    var ingredients = [Ingredient]()
    var steps = [Step]()
    var desc: String?
    var img: String?
    var img_url: String?
    
    init (_ json:[String:AnyObject]){
        self.name = json["name"] as? String
        self.url = json["url"] as? String
        self.desc = json["desc"] as? String
        self.img = json["img"] as? String
        self.img_url = json["img_url"] as? String
        
        if let arr = json["ingredients"] as? [[String:AnyObject]]{
            var result = [Ingredient]()
            
            for item in arr {
                let obj = Ingredient(item)
                result.append(obj)
            }
            self.ingredients = result
        
        }
        if let arr = json ["steps"] as? [[String:AnyObject]]{
            var result = [Step]()
            for item in arr {
                let obj = Step(item)
                result.append(obj)
            }
            self.steps = result
        }
        
// ---------------2-variant -----------
        
//        if let arr = json ["steps"] as? [[String:AnyObject]]{
//            for item in arr {
//                self.steps.append(Step(item))
//            }
//        }
        
    }

    
}

class Ingredient {
    var name: String?
    
    init(_ json: [String: AnyObject]){
        self.name = json["name"] as? String
    }
}

class Step {
    var name: String?
    var img: String?
    
    init(_ json: [String: AnyObject]){
        self.name = json["name"] as? String
        self.img = json["img"] as? String
    }
}
