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
        FriendData(friendName: "Алиска0"),
        FriendData(friendName: "Барсик1"),
        FriendData(friendName: "Васьк2"),
        FriendData(friendName: "Стеша3"),
        FriendData(friendName: "Пушок4"),
        FriendData(friendName: "Фекла5"),
        FriendData(friendName: "Маруська6"),
        FriendData(friendName: "Мурка7"),
        FriendData(friendName: "Счастливчик8"),
        FriendData(friendName: "Забияка9"),
        FriendData(friendName: "Борька10"),
        FriendData(friendName: "Принц11"),
        FriendData(friendName: "Софочка12"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: UITableViewDataSource
extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { fatalError() }
        
        let data = friends[indexPath.row]
        cell.nameLabel.text = data.friendName
        //cell.friendImageView = UIImageView(image: data.friendImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: UITableViewDelegate
extension FriendsViewController: UITableViewDelegate {
    
}
