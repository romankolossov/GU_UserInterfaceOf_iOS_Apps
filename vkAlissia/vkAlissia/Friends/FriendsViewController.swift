//
//  FriendsViewController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 09.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

var favoriteImages: [UIImage] = [
    UIImage(named: "Alissia0")!,
    UIImage(named: "Alissia1")!,
    UIImage(named: "Alissia2")!,
    UIImage(named: "Alissia3")!,
    UIImage(named: "Alissia4")!,
    UIImage(named: "Alissia5")!,
    UIImage(named: "Alissia6")!,
    UIImage(named: "Alissia7")!,
    UIImage(named: "Alissia8")!,
    UIImage(named: "Alissia9")!,
    UIImage(named: "Alissia10")!,
    UIImage(named: "Alissia11")!,
    UIImage(named: "Alissia12")!
]

class FriendsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var friends: Array<FriendData> = [
        FriendData(friendName: "Алиска", friendImage: UIImage(named: "Alissia0")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Барсика", friendImage: UIImage(named: "Alissia1")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Василиса", friendImage: UIImage(named: "Alissia2")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Стеша", friendImage: UIImage(named: "Alissia3")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Пушок", friendImage: UIImage(named: "Alissia4")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Фекла", friendImage: UIImage(named: "Alissia5")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Маруська", friendImage: UIImage(named: "Alissia6")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Мурка", friendImage: UIImage(named: "Alissia7")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Счастливчик", friendImage: UIImage(named: "Alissia8")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Забияка", friendImage: UIImage(named: "Alissia9")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Мурлыка", friendImage: UIImage(named: "Alissia10")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Принцесса", friendImage: UIImage(named: "Alissia11")!, favoriteImages: favoriteImages.shuffled()),
        FriendData(friendName: "Софочка", friendImage: UIImage(named: "Alissia12")!, favoriteImages: favoriteImages.shuffled())
    ]
    
    var sections: [Character: [FriendData]] = [:]
    var sectionTitles = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        for friend in friends {
            let firstLetter = friend.friendName.first!
            
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(friend)
            } else {
                sections[firstLetter] = [friend]
            }
        }
        
        sectionTitles = Array(sections.keys)
        sectionTitles.sort()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = segue.destination as? CertainFriendViewController {
            guard let cell = sender as? FriendCell else { return }
            
            destination.friendName = cell.nameLabel.text
            destination.friendImage = cell.friendImageView.image
            destination.favoriteImages = cell.favoriteImages
        }
    }
}

// MARK: - UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[sectionTitles[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles.map{String($0)}
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionTitles[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { fatalError() }
        guard  let friend = sections[sectionTitles[indexPath.section]]? [indexPath.row] else { fatalError() }
        
        cell.nameLabel.text = friend.friendName
        cell.friendImageView.image = friend.friendImage
        cell.favoriteImages = friend.favorireImages
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    
}
