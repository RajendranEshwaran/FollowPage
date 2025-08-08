//
//  FitnessModel.swift
//  FollowPage
//
//  Created by Rajendran Eshwaran on 7/23/25.
//

import Foundation

enum FitnessTabbarItems: Int, CaseIterable {
    case home
    case jumps
    case battleFit
    case progress
    case profile
    
    var tabbarTitle: String {
        switch self {
        case .home:
            return "Home"
        case .jumps:
            return "Jumps"
        case .battleFit:
            return "Battle Fit"
        case .progress:
            return "Progress"
        case .profile:
            return "Profile"
        }
    }
    
    var tabbarImageName: String {
        switch self {
        case .home:
            return "house.fill"
        case .jumps:
            return "figure.jumprope"
        case .battleFit:
            return "minus.plus.batteryblock.exclamationmark.fill"
        case .progress:
            return "figure.jumprope.circle"
        case .profile:
            return "person.fill"
        }
    }
}

struct ProfileItemList : Identifiable {
    let id = UUID()
    let item: String
    let icon: String
    init(item: String, icon: String) {
        self.item = item
        self.icon = icon
    }
    
    static let profileItemList = [ProfileItemList(item: "Friends", icon: "person.3"),
               ProfileItemList(item: "Statistics", icon: "lines.measurement.horizontal"),
                ProfileItemList(item: "Academy", icon:"building.columns" ),
                ProfileItemList(item: "Strenght Log", icon: "figure.strengthtraining.traditional"),
                ProfileItemList(item: "Sound", icon: "music.note")]
}
