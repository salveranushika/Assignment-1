//
//  CollectionViewController.swift
//  Assignment 1
//
//  Created by Salver Anushika on 9/11/24.
//

import UIKit

private let reuseIdentifier = "CollectCell"

class CollectionViewController: UICollectionViewController {

    // For Lazy loading of the image model instance
    lazy var imageModel: ImageModel = {
        return ImageModel.sharedInstance()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the line below if you want to register a cell class programmatically
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Use the model's numberOfImages method to get the count
        return self.imageModel.numberOfImages()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell {
            
            let name = self.imageModel.getImageName(for: indexPath.row)
            
            // Use getImageWithName to fetch the correct image
            cell.imageView.image = self.imageModel.getImageWithName(name)
            
            return cell
        } else {
            fatalError("Could not dequeue cell")
        }
    }


    // MARK: - UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
}
