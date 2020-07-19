//
//  GroupsViewController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 09.07.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class AllGroupsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var groups: [GroupData] = [
        GroupData(groupName: "Acura", groupAvatar: UIImage(named: "Acura")!),
        GroupData(groupName: "Alfa_Romeo", groupAvatar: UIImage(named: "Alfa_Romeo")!),
        GroupData(groupName: "Aston_Martin", groupAvatar: UIImage(named: "Aston_Martin")!),
        GroupData(groupName: "Audi", groupAvatar: UIImage(named: "Audi")!),
        GroupData(groupName: "Bentley", groupAvatar: UIImage(named: "Bentley")!),
        GroupData(groupName: "BMW", groupAvatar: UIImage(named: "BMW")!),
        GroupData(groupName: "Citroen", groupAvatar: UIImage(named: "Citroen")!),
        GroupData(groupName: "Ferrari", groupAvatar: UIImage(named: "Ferrari")!),
        GroupData(groupName: "Jaguar", groupAvatar: UIImage(named: "Jaguar")!),
        GroupData(groupName: "Land_Rover", groupAvatar: UIImage(named: "Land_Rover")!),
        GroupData(groupName: "Mercedes-Benz", groupAvatar: UIImage(named: "Mercedes-Benz")!),
        GroupData(groupName: "Porsche", groupAvatar: UIImage(named: "Porsche")!),
        GroupData(groupName: "Rolls-Roys", groupAvatar: UIImage(named: "Rolls-Roys")!),
        GroupData(groupName: "Volvo", groupAvatar: UIImage(named: "Volvo")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "GroupCell", bundle: Bundle.main), forCellReuseIdentifier: "GroupCell")
    }
}

// MARK: - UITableViewDataSource
extension AllGroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else { fatalError() }
        
        let group = groups[indexPath.row]
        
        cell.groupNameLabel.text = group.groupName
        cell.groupAvatarView.image = group.groupAvatar
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AllGroupsViewController: UITableViewDelegate {
    
}
