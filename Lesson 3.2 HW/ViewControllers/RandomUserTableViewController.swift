//
//  ViewController.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 08.08.2022.
//

import UIKit

class RandomUserViewController: UITableViewController {
    
    private var randomUser: [RandomUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRandomUser()
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
        //cell.configure(with: user.results)

        return cell
    }
}

extension RandomUserViewController {
    func fetchRandomUser() {
        NetworkManager.shared.fetch(from: Link.randomUserApi.rawValue) { [weak self] result in
            switch result {
            case .success(let user):
                self?.randomUser = user
                self?.tableView.reloadData()
                print(user)
            case .failure(let error):
                print(error)
            }
        }
    }
}



