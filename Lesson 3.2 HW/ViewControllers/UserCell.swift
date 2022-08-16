//
//  UserCellTableViewCell.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 13.08.2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet var userPicture: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var timezone: UILabel!
    @IBOutlet var dateOfBirth: UILabel!
    
    func configure(with userResults: Results) {
        userPicture?.layer.cornerRadius = (userPicture?.frame.size.width ?? 0.0) / 2
        userPicture?.clipsToBounds = true
        userPicture?.layer.borderWidth = 3.0
        userPicture?.layer.borderColor = UIColor.white.cgColor
        
        userName.text = "\(userResults.name.title) \(userResults.name.first) \(userResults.name.last)"
        location.text = "\(userResults.location.state) \(userResults.location.city)"
        timezone.text = "\(userResults.location.timezone.description) \(userResults.location.timezone.offset)"
        dateOfBirth.text = userResults.dob.date
        
        NetworkManager.shared.fetchPicture(from: userResults.picture.large) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.userPicture.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showSpinner(in view: UITableViewCell) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true

        view.addSubview(activityIndicator)

        return activityIndicator
    }
}
