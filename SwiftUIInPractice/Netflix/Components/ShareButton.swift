//
//  ShareButton.swift
//  SwiftUIInPractice
//
//  Created by Ramill Ibragimov on 4/13/24.
//

import SwiftUI

struct ShareButton: View {
    
    var url: String = "https://www.apple.com"
    
    @ViewBuilder
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGrey)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(Color.black.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ShareButton()
    }
}
