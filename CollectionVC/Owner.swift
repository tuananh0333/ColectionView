//
//  Owner.swift
//  CollectionVC
//
//  Created by le tuan anh on 8/16/17.
//  Copyright © 2017 le tuan anh. All rights reserved.
//

import Foundation
struct Owner {
    var ownerName: String
    var ownerAvatar: String
    
    init(with dictionary: [String: Any]) {
        ownerName = dictionary["login"] as! String
        ownerAvatar = dictionary["avatar_url"] as! String
    }
}
