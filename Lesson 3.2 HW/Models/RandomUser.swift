//
//  RandomUser.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 08.08.2022.
//

import Foundation

struct RandomUser: Decodable {
    let results: [Results]
    
    init(results: [Results]) {
        self.results = results
    }
    
    init(userData: [String: Any]) {
        results = userData["results"] as? [Results] ?? []
    }
    
    static func getUser(from value: Any) -> [RandomUser] {
        guard let userData = value as? [[String: Any]] else { return []}
        var users: [RandomUser] = []
        for key in userData {
            let usersArray = key["results"] as? [Results] ?? []
            for userDictionary in usersArray {
                let randomResults = RandomUser(userData: userDictionary)
                users.append(randomResults)
            }
        }
        return users
    }
}



struct Results: Decodable {
    let gender: String
    let email: String
    let name: Name
    let login: Login
    let dob: DateOfBirth
    let picture: Picture
    let location: Location
}

struct Name: Decodable {
    let first: String
    let title: String
    let last: String
}

struct Login: Decodable {
    let username: String
    let password: String
}

struct DateOfBirth: Decodable {
    let date: String
    let age: Int
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Location: Decodable {
    let timezone: Timezone
    let state: String
    let city: String
}

struct Timezone: Decodable {
    let offset: String
    let description: String
}


