//
//  GiveBack.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/17/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import SwiftUI

struct GiveBack: View {
    
    var action: (() -> Void)
    
    @State var presentingStickerPromo: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 14, height: 14), style: .circular)
            .fill(LinearGradient(gradient: Gradient(colors: 
                [Color(red: 0.925, green: 0.345, blue: 0.514),
                 Color(red: 0.831, green: 0.259, blue: 0.408)]), 
                                       startPoint: .top, 
                                       endPoint: .bottom))
            .overlay(
                HStack() {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .padding(.leading)
                    Text("Give back and get stickers")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .padding(.trailing)
                }
        )
            .onTapGesture {
                self.presentingStickerPromo.toggle()
                self.action()
        }
        .frame(minWidth: 100, idealWidth: 160, maxWidth: 370, minHeight: 50, idealHeight: 60, maxHeight: 80, alignment: .center)
        .sheet(isPresented: $presentingStickerPromo) {
            IndieAppPack()
        }
    }
}

struct GiveBack_Previews: PreviewProvider {
    static var previews: some View {
        GiveBack(action: {
            print("Presenting Indie Sticker Pack promo...")
        })
    }
}
