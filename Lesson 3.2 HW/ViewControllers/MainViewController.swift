//
//  MainViewController.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 13.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fetchUser" {
            guard let userVC = segue.destination as? RandomUserViewController else { return }
            userVC.fetchRandomUser()
        }
    }
}

