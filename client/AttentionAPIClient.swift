//
//  AttentionAPIClient.swift
//  Attension
//
//  Created by Hiraku Ohno on 2016/04/19.
//  Copyright © 2016年 Hiraku Ohno. All rights reserved.
//

import APIKit
import SwiftTask

public class AttentionAPIClient: NSObject {

    public static let sharedInstance = AttentionAPIClient()

    func getAttentionItems(latitude: Double, longitude: Double, radius: Double) -> Task<Float, [AttentionResponseItem], NSError> {
        return Task<Float, [AttentionResponseItem], NSError>(promiseInitClosure: { (fulfill, reject) in
            let request = GetItemsRequest()
            Session.sendRequest(request) { (result) in
                switch result {
                case .Success(let responseItems):
                    let items = responseItems.filter({(item) in
                        item != nil
                    }).map({ (item) -> AttentionResponseItem in
                        item!
                    })
                    fulfill(items)

                case .Failure(let error):
                    debugPrint(error)
                    reject(NSError(domain: "", code: 0, userInfo: nil))
                }
            }
        })
    }
}