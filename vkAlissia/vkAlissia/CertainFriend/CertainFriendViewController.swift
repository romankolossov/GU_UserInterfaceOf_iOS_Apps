//
//  CertainFriendViewController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 09.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class CertainFriendViewController: UIViewController {
    @IBOutlet weak var collectiovView: UICollectionView!
    var friendName: String?
    var friendImage: UIImage?
    var favoriteImages: [UIImage] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectiovView.dataSource = self
        collectiovView.delegate = self
        
        if let layout = collectiovView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 140, height: 140)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CertainFriendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return favoriteImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CertainFriendCell", for: indexPath) as? CertainFriendCell else { fatalError() }
        
        cell.nameLabel.text = friendName
        cell.friendImageView.image = favoriteImages[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CertainFriendViewController: UICollectionViewDelegate {
    
}
