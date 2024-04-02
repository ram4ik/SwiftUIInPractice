//
//  User.swift
//  SwiftUIInPractice
//
//  Created by Ramill Ibragimov on 3/26/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    var work: String {
        "Work at Some Job"
    }
        
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile!"
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo"),
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "🏃", text: "Running"),
            UserInterest(iconName: nil, emoji: "🚴‍♀️", text: "Cycling"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🍳", text: "Cooking"),
        ]
    }
    
    var images: [String] {
        [
            "https://picsum.photos/500/500",
            "https://picsum.photos/600/600",
            "https://picsum.photos/700/700"
        ]
    }
    
    static var mock: User {
        User(
            id: 456,
            firstName: "John",
            lastName: "Appleseed",
            age: 42,
            email: "john.appleseed@apple.com",
            phone: "",
            username: "",
            password: "",
            image: Constants.randomImage,
            height: 180,
            weight: 200
        )
    }
}
