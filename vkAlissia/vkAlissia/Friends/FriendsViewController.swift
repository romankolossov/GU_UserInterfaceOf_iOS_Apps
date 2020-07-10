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
    
    var friend = [
        FriendData(name: "Алиска0"),
        FriendData(name: "Барсик1"),
        FriendData(name: "Васьк2"),
        FriendData(name: "Стеша3"),
        FriendData(name: "Пушок4"),
        FriendData(name: "Фекла5"),
        FriendData(name: "Маруська6"),
        FriendData(name: "Мурка7"),
        FriendData(name: "Счастливчик8"),
        FriendData(name: "Забияка9"),
        FriendData(name: "Борька10"),
        FriendData(name: "Принц11"),
        FriendData(name: "Софочка12"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell else { fatalError() }
//
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else { fatalError() }
        
        let data = friend[indexPath.row]
        cell.nameLabel.text = String(data.name)
        //cell.friendImageView = UIImageView(image: data.friendImage)
        
        return cell
    }
    
}

extension FriendsViewController: UITableViewDelegate {
    
}
