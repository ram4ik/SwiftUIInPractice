//
//  ContentView.swift
//  SwiftUIInPractice
//
//  Created by Ramill Ibragimov on 3/26/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) {_ in 
                    SpotifyHomeView()
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()        
    }
}
