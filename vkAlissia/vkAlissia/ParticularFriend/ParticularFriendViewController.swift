//
//  CertainFriendViewController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 09.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class ParticularFriendViewController: UIViewController {
    @IBOutlet weak var collectiovView: UICollectionView!
    var friendName: String?
    var friendAvatar: UIImage?
    var favoriteImages: [UIImage] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        collectiovView.dataSource = self
        collectiovView.delegate = self
        
        if let layout = collectiovView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 202, height: 202)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ParticularFriendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return favoriteImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParticularFriendCell", for: indexPath) as? ParticularFriendCell else { fatalError() }
        
        cell.nameLabel.text = friendName
        cell.friendImageView.image = favoriteImages[indexPath.row]
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ParticularFriendViewController: UICollectionViewDelegate {
    
}
