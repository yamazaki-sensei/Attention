//
//  AttentionItem.swift
//  Attension
//
//  Created by Hiraku Ohno on 2016/04/13.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import UIKit
import RealmSwift

class AttentionItem: Object {
    dynamic var identifier: String = ""
    dynamic var latitude: CLLocationDegrees = 0.0
    dynamic var longtitude: CLLocationDegrees = 0.0
    dynamic var attentionBody: String = ""
    dynamic var placeName: String = ""
    dynamic var onServer: Bool = false
    
    override class func primaryKey() -> String? {
        return "identifier"
    }
}

extension AttentionItem {
    func createIdentifier() -> String {
        let latString = String(latitude).stringByReplacingOccurrencesOfString(".", withString: "")
        let lonString = String(longtitude).stringByReplacingOccurrencesOfString(".", withString: "")
        return latString + lonString
    }
    
    /* onServer should be in response only. */
    func toDictionary() -> [String : AnyObject] {
        return ["identifier"     : identifier,
                "latitude"       : latitude,
                "longitude"      : longtitude,
                "attention_body" : attentionBody,
                "place_name"     : placeName]
        
    }
}

func ==(left: AttentionItem, right: AttentionItem) -> Bool {
    return left.identifier == right.identifier
}

func !=(left: AttentionItem, right: AttentionItem) -> Bool {
    return !(right == left)
}