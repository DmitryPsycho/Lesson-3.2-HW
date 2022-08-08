//
//  RandomUser.swift
//  Lesson 3.2 HW
//
//  Created by Psycho on 08.08.2022.
//

import Foundation

struct RandomUser: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let gender: String
    let email: String
    let name: Name
    let login: Login
    let dob: DateOfBirth
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

struct Location: Decodable {
    let timezone: Timezone
    let state: String
    let city: String
}

struct Timezone: Decodable {
    let offset: String
    let description: String
}
