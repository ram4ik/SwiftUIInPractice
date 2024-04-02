//
//  InterestPillGridView.swift
//  SwiftUIInPractice
//
//  Created by Ramill Ibragimov on 4/2/24.
//

import SwiftUI
import SwiftfulUI

struct UserInterest: Identifiable {
    let id = UUID().uuidString
    var iconName: String? = nil
    var emoji: String? = nil
    var text: String
}

struct InterestPillGridView: View {
    
    var interest: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interest) { interest in
                if let interest {
                    InterestPillView(
                        iconName: interest.iconName,
                        emoji: interest.emoji,
                        text: interest.text
                    )
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        InterestPillGridView(interest: User.mock.basics)
        InterestPillGridView(interest: User.mock.interests)
    }
}
