//
//  SpotifyPlayListView.swift
//  SwiftUIInPractice
//
//  Created by Ramill Ibragimov on 3/30/24.
//

import SwiftUI

struct SpotifyPlayListView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand,
                        imageName: product.thumbnail
                    )
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 100,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand,
                            onCellPressed: {},
                            onEllipsisPressed: {}
                        )
                        .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func getData() async {
        do {
            products = try await DatabaseHelper().getProduct()
            
        } catch {
            
        }
    }
}

#Preview {
    SpotifyPlayListView()
}
