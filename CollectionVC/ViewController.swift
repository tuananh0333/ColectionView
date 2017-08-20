//
//  ViewController.swift
//  CollectionVC
//
//  Created by le tuan anh on 8/10/17.
//  Copyright © 2017 le tuan anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var Collect_list: UICollectionView!
    
    var listRepos = [ReposModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Collect_list.dataSource = self
        Collect_list.delegate = self
        
        getReposData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listRepos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        let currentRepos = self.listRepos[indexPath.row]
        cell.loadData(repo: currentRepos, owner: currentRepos._owner!)
//        cell.downLoadImage(url: currentRepos._owner!)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getReposData(){
        guard let url = URL(string: constants.URLString)
            else { return }
        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            if error == nil && data != nil{
                do{
                    let repo = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: Any]]
                    for dictRepo in repo{
                        let repos = ReposModel(with: dictRepo)
                        self.listRepos.append(repos)
                        print(dictRepo)
                    }
                    DispatchQueue.main.async {
                        self.Collect_list.reloadData()
                    }
                }
                catch{
                    print("Error")
                }
            }
            else if error != nil{
                print(error.debugDescription)
            }
        }).resume()
    }


}

