//
//  ReposModel.swift
//  CollectionVC
//
//  Created by le tuan anh on 8/16/17.
//  Copyright © 2017 le tuan anh. All rights reserved.
//

import Foundation
struct ReposModel {
    var reposName: String
    var _owner : Owner?
    init(with dictionary: [String: Any]){
        reposName = dictionary["name"] as! String
        if let ownerDictionary = dictionary["owner"]{
            self._owner = Owner(with: ownerDictionary as! [String : Any])
        }
    }
}
