//
//  CategoryCell.swift
//  Buoi18
//
//  Created by Quân on 12/3/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrCategory:[Category] = []
    
    var didSelectCategory:((_ id: String)->Void)! = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemCell", for: indexPath) as! CategoryItemCell
        cell.lbCategory.text = arrCategory[indexPath.item].id
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if didSelectCategory != nil {
            didSelectCategory(arrCategory[indexPath.item].id)
        }
    }
    
}
