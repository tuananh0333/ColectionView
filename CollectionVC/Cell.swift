//
//  Cell.swift
//  CollectionVC
//
//  Created by le tuan anh on 8/16/17.
//  Copyright © 2017 le tuan anh. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var img_Avatar: UIImageView!
    @IBOutlet weak var lbl_UserName: UILabel!
    @IBOutlet weak var lbl_RepoName: UILabel!
    
    func loadData(repo: ReposModel, owner: Owner){
        lbl_RepoName.text = repo.reposName
        lbl_UserName.text = owner.ownerName
        guard let url = URL(string:owner.ownerAvatar) else{ return }
        img_Avatar.sd_setImage(with: url, placeholderImage: UIImage())
    }
    
//    func downLoadImage(owner: Owner){
//
////        DispatchQueue.global(qos: .background).async {
////            print("This is run on the background queue")
////            do{
////            let imgData = try Data(contentsOf: url)
////                DispatchQueue.main.async {
////                    print("This is run on the main queue, after the previous code in outer block")
////                    self.img_Avatar.image = UIImage(data: imgData)
////                }
////            }catch let error{
////                print(error.localizedDescription)
////            }
////
////        }
//    }
}
