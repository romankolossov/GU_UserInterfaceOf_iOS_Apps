//
//  FriendsViewController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 09.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var friends: Array<FriendData> = [
        FriendData(friendName: "Алиска", friendImage: UIImage(imageLiteralResourceName: "Alissia0")),
        FriendData(friendName: "Барсика", friendImage: UIImage(imageLiteralResourceName: "Alissia1")),
        FriendData(friendName: "Василиса", friendImage: UIImage(imageLiteralResourceName: "Alissia2")),
        FriendData(friendName: "Стеша", friendImage: UIImage(imageLiteralResourceName: "Alissia3")),
        FriendData(friendName: "Пушок", friendImage: UIImage(imageLiteralResourceName: "Alissia4")),
        FriendData(friendName: "Фекла", friendImage: UIImage(imageLiteralResourceName: "Alissia5")),
        FriendData(friendName: "Маруська", friendImage: UIImage(imageLiteralResourceName: "Alissia6")),
        FriendData(friendName: "Мурка", friendImage: UIImage(imageLiteralResourceName: "Alissia7")),
        FriendData(friendName: "Счастливчик", friendImage: UIImage(imageLiteralResourceName: "Alissia8")),
        FriendData(friendName: "Забияка", friendImage: UIImage(imageLiteralResourceName: "Alissia9")),
        FriendData(friendName: "Мурлыка", friendImage: UIImage(imageLiteralResourceName: "Alissia10")),
        FriendData(friendName: "Принцесса", friendImage: UIImage(imageLiteralResourceName: "Alissia11")),
        FriendData(friendName: "Софочка", friendImage: UIImage(imageLiteralResourceName: "Alissia12")),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destination = segue.destination as? CertainFriendViewController {
            guard let cell = sender as? FriendCell else { return }
            
            destination.friendName = cell.nameLabel.text
            destination.friendImage = cell.friendImageView.image
        }
    }
}

// MARK: - UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { fatalError() }
        
        let data = friends[indexPath.row]
        cell.nameLabel.text = data.friendName
        cell.friendImageView.image = data.friendImage
        
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
