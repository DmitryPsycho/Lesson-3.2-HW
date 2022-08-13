//
//  UserCellTableViewCell.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 13.08.2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var userFirstName: UILabel!
    
    func configureCell(with userResults: Results) {
        userFirstName.text = userResults.name.first
        
        NetworkManager.shared.fetchPicture(from: userResults.picture.large) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.userPicture.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }

    }

}
