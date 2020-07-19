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
        GroupData(groupName: "Acura", groupImage: UIImage(named: "Acura")!),
        GroupData(groupName: "Alfa_Romeo", groupImage: UIImage(named: "Alfa_Romeo")!),
        GroupData(groupName: "Aston_Martin", groupImage: UIImage(named: "Aston_Martin")!),
        GroupData(groupName: "Audi", groupImage: UIImage(named: "Audi")!),
        GroupData(groupName: "Bentley", groupImage: UIImage(named: "Bentley")!),
        GroupData(groupName: "BMW", groupImage: UIImage(named: "BMW")!),
        GroupData(groupName: "Citroen", groupImage: UIImage(named: "Citroen")!),
        GroupData(groupName: "Ferrari", groupImage: UIImage(named: "Ferrari")!),
        GroupData(groupName: "Jaguar", groupImage: UIImage(named: "Jaguar")!),
        GroupData(groupName: "Land_Rover", groupImage: UIImage(named: "Land_Rover")!),
        GroupData(groupName: "Mercedes-Benz", groupImage: UIImage(named: "Mercedes-Benz")!),
        GroupData(groupName: "Porsche", groupImage: UIImage(named: "Porsche")!),
        GroupData(groupName: "Rolls-Roys", groupImage: UIImage(named: "Rolls-Roys")!),
        GroupData(groupName: "Volvo", groupImage: UIImage(named: "Volvo")!)
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
        
        cell.groupLabel.text = group.groupName
        cell.groupAvatarView.image = group.groupImage
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AllGroupsViewController: UITableViewDelegate {
    
}
