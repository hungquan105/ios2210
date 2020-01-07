//
//  ViewController.swift
//  client
//
//  Created by Quân on 1/2/20.
//  Copyright © 2020 QuanNguyen. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrImages:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let name = "Quan Nguyen"
//        let parameter = [
//            "name" : name
//        ]
//
//        RequestService.shared.request("http://localhost:3000/test", .post, parameter, URLEncodedFormParameterEncoder.default, nil, BaseResponse.self) { (result, data, error) in
//            guard let data = data as? BaseResponse else {return}
//            print(data.data)
//        }
        
    }

    @IBAction func Choose(_ sender: Any) {
        let pickerController = DKImagePickerController()
//        pickerController.allowMultipleTypes = true

        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
            
            // [DKAsset] -> [UIImage]
            var images = [UIImage]()
            assets.forEach { (img) in
                print("abc")
                img.fetchImage(with: CGSize(width: 300, height: 300)) { (image, info) in
                    if let image = image {
                        images.append(image)
                        print(self.arrImages.count)
                        
                    }
                }
            
            }
            print(images.count)
            self.arrImages.append(contentsOf: images)
            print(self.arrImages[0].size)
            self.collectionView.reloadData()
        }

        self.present(pickerController, animated: true) {}
    }
    
    @IBAction func Upload(_ sender: Any) {
        
        // upload to server
        
            // dataImages
            var dataImages : [Dictionary<String, Any>] = []

            self.arrImages.forEach { (img) in
                
                // resize image

                let convertImage = img.jpegData(compressionQuality: 0)
                
                dataImages.append(["key" : "photos",

                                   "value" : convertImage])

            }
        
        RequestService.shared.upload("http://localhost:3000/array", nil, ArrayResponse.self, dataImages) { (result, data, error) in
            guard let data = data as? ArrayResponse else {return}
            print(data.data[0].originalname)
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoItemCell", for: indexPath) as! PhotoItemCell
        // hien thi
        cell.imgv.image = arrImages[indexPath.item]
        return cell
    }

}

struct BaseResponse:Codable {
    let result:Bool
    let message:String
    let data:String
}

public struct ArrayResponse:Codable {
    
    public var data : [Photo]
    public var message : String
    public var result : Bool
    
}

public struct Photo:Codable {
    
    public var destination : String
    public var encoding : String
    public var fieldname : String
    public var filename : String
    public var mimetype : String
    public var originalname : String
    public var path : String
    public var size : Int
    
}
