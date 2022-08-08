//
//  URL.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 08.08.2022.
//

import Foundation

struct Link {
    let apiUrl: String
    
    static func getUrl() -> Link {
        Link(
            apiUrl: "https://randomuser.me/api/"
        )
    }
}
