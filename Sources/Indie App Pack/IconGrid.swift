//
//  IconGrid.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/18/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import SwiftUI

struct IconGrid: View {
    
    let chunkedIcons = IndieIconPreviewGenerator.allIcons().chunked(into: 28) 
    
    var body: some View {
        VStack() {
            ForEach(0..<chunkedIcons.count) { index in
                Row(chunkdex: index, chunkedIcons: self.chunkedIcons)
            }
        }
        .padding()
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Row: View {
    
    @State var chunkdex: Int
    @State var chunkedIcons: [[String]]
    
    @State private var offset: CGFloat = 2320
    
    var isEvenChunkdex: Bool {
        if chunkdex % 2 == 0 {
            return true
        } else {
            return false
        }
    }
    
    var slideAnimation: Animation {
        let newAnimation = Animation.linear(duration: 60).repeatForever(autoreverses: true)
        return newAnimation
    }
    
    var body: some View {
        HStack() {
            ForEach(chunkedIcons[chunkdex], id: \.self) { icon in
                AppIcon(iconIndex: icon)
            }
        }
        .padding()
        .frame(width: 5000, height: 200, alignment: (isEvenChunkdex ? .leading : .trailing))
        .offset(x: (isEvenChunkdex ? offset : -offset), y: 0)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(self.slideAnimation) {
                self.offset -= 3300.0
                self.offset -= CGFloat(Int.random(in: 0...200))
            }
        }
    }
}

struct AppIcon: View {
    
    @State var iconIndex: String
    
    var body: some View {
        Image(iconIndex)
            .resizable()
            .scaledToFit()
            .cornerRadius(14)
            .padding()
            .frame(width: 120, height: 120)
    }
    
}


struct IconGrid_Previews: PreviewProvider {
    static var previews: some View {
        IconGrid()
    }
}
