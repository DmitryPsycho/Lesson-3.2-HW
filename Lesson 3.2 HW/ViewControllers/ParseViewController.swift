//
//  ViewController.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 08.08.2022.
//

import UIKit

class ParseViewController: UIViewController {
    
    private let link = Link.getUrl()
    
    @IBAction func parseButtonPressed() {
        fetchRandomUser()
    }
    
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug area",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

extension ParseViewController {
    
    private func fetchRandomUser() {
        guard let url = URL(string: Link.getUrl().apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let randomUser = try JSONDecoder().decode(RandomUser.self, from: data)
                self?.successAlert()
                print(randomUser)
            } catch let error {
                self?.failedAlert()
                print(error)
            }
            
        }.resume()
    }
}
