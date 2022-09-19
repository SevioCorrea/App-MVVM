//
//  ProfileViewModel.swift
//  MVVM
//
//  Created by Sévio on 19/09/22.
//

import Foundation


// MARK - ViewModel
struct ProfileViewModel {
    
    // Para determinar se estamos seguindo ou não esse Perfil
    var isFollowing = false
    
    var userFollowers = String()
    
    
    var user = User(picture: "Image",
                    name: "MVVM - Sévio",
                    nick: "LinkedIn: Sévio Corrêa",
                    followers: 20000)
    
    init() {
        loadFollowers()
    }
    mutating func loadFollowers() {
        self.userFollowers = customizeNumber(value: user.followers)
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)k"
    }
    
    mutating func followToggle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.followers += 1) : (self.user.followers -= 1)
        loadFollowers()
    }
}
