//
//  NetflixDetailsProductView.swift
//  SwiftUIInPractice
//
//  Created by Ramill Ibragimov on 4/12/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsProductView: View {
    
    var title: String = "Movie Title"
    var isNew: Bool = true
    var yearRelesed: String? = "2024"
    var seasonCount: Int? = 2
    var hasClosedCaption: Bool = true
    var isTopTen: Int? = 6
    var descriptionText: String? = "This is the description for the title that is selected and it should go multiple lines."
    var castText: String? = "Cast: RI"
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                
                if let yearRelesed {
                    Text(yearRelesed)
                }
                
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                
                if hasClosedCaption {
                    Image(systemName: "caption.bubble")
                }
            }
            .foregroundStyle(.netflixLightGrey)
            
            if let isTopTen {
                HStack(spacing: 8) {
                    topTenIcon
                    
                    Text("\(isTopTen) in TV Shows Today")
                        .font(.headline)
                }
            }
            
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundStyle(.netflixDarkGrey)
                .background(.netflixWhite)
                .cornerRadius(4)
                .asButton(.press) {
                    onPlayPressed?()
                }
                
                HStack {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundStyle(.netflixWhite)
                .background(.netflixDarkGrey)
                .cornerRadius(4)
                .asButton(.press) {
                    onDownloadPressed?()
                }
            }
            .font(.callout)
            .fontWeight(.medium)
            
            Group {
                if let descriptionText {
                    Text(descriptionText)
                }
                
                if let castText {
                    Text(castText)
                        .foregroundStyle(.netflixLightGrey)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var topTenIcon: some View {
        Rectangle()
            .fill(.netflixRed)
            .frame(width: 28, height: 28)
            .overlay(
                VStack(spacing: -4) {
                    Text("TOP")
                        .fontWeight(.bold)
                        .font(.system(size: 8))
                    
                    Text("10")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .offset(y: 1)
            )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 40) {
            NetflixDetailsProductView()
            NetflixDetailsProductView(isTopTen: nil)
            NetflixDetailsProductView(
                yearRelesed: nil, 
                seasonCount: nil,
                hasClosedCaption: false,
                isTopTen: nil
            )
        }
    }
}
