//
//  ViewController.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 08.08.2022.
//

// Над визуалом не успел поработать, был огромный затык с отображением данных. Не знаю проблема была в апи или моих руках xD К следующему уроку обещаю проработать этот момент)

import UIKit

class RandomUserViewController: UITableViewController {
    
    private var randomUser: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 500
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomUser.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "userCell",
                for: indexPath
            ) as? UserCell
        else {
            return UITableViewCell()
        }
        
        let user = randomUser[indexPath.row]
        cell.configure(with: user)
        
        return cell
    }
}

extension RandomUserViewController {
    func fetchRandomUser() {
        NetworkManager.shared.fetch(RandomUser.self, from: NetworkManager.url) { [weak self] result in
            switch result {
            case .success(let user):
                self?.randomUser = user.results
                self?.tableView.reloadData()
                print(user)
            case .failure(let error):
                print(error)
            }
        }
    }
}



