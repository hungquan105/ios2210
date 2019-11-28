//
//  SecondViewController.swift
//  Buoi15
//
//  Created by Quân on 11/23/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.imgv.image = #imageLiteral(resourceName: "1455749513_1225876")
        return cell
    }
    
}
