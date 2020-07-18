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
        FriendData(friendName: "Алиска", friendImage: UIImage(named: "Alissia0") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Барсика", friendImage: UIImage(named: "Alissia1") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Василиса", friendImage: UIImage(named: "Alissia2") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Стеша", friendImage: UIImage(named: "Alissia3") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Пушок", friendImage: UIImage(named: "Alissia4") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Фекла", friendImage: UIImage(named: "Alissia5") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Маруська", friendImage: UIImage(named: "Alissia6") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Мурка", friendImage: UIImage(named: "Alissia7") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Счастливчик", friendImage: UIImage(named: "Alissia8") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Забияка", friendImage: UIImage(named: "Alissia9") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Мурлыка", friendImage: UIImage(named: "Alissia10") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Принцесса", friendImage: UIImage(named: "Alissia11") ?? UIImage(named: "Alissia_face")!),
        FriendData(friendName: "Софочка", friendImage: UIImage(named: "Alissia12") ?? UIImage(named: "Alissia_face")!)
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
        return friends.count
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
