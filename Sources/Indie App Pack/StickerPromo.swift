//
//  StickerPromo.swift
//  Indie App Pack Display
//
//  Created by Sam Spencer on 6/17/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import SwiftUI
import UIKit

struct IndieAppPack: View {
    
    var isLargerScreen: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack() {
            HStack(alignment: .bottom) {
                Image("StickerPackIcon").resizable()
                    .padding()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(minWidth: 56, idealWidth: 80, maxWidth: 110, minHeight: 56, idealHeight: 80, maxHeight: 110, alignment: .leading)
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading)
            
            Text("Get a limited-time sticker pack from your favorite indie iOS apps.\n\nGive back to our global community.")
                .foregroundColor(.white)
                .font(.system(size: (isLargerScreen ? 56 : 30), weight: .heavy, design: .default))
                .lineSpacing(5)
                .padding()
                .padding(.horizontal)
            
            Button(action: { 
                UIApplication.shared.open(URL(string: "https://www.indiestickerpack.com/product/stickerpack")!, options: [:])
            }) {
                HStack() {
                    Text("Get the physical sticker pack")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .padding(.leading)
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .padding(.trailing)
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: 
                [Color(red: 0.259, green: 0.632, blue: 0.925),
                 Color(red: 0.0, green: 0.439, blue: 0.788)]), 
                                       startPoint: .top, endPoint: .bottom))
                .cornerRadius(4)
                .padding(.horizontal)
            
            Button(action: { 
                UIApplication.shared.open(URL(string: "https://apps.apple.com/us/app/indie-sticker-pack/id1518475246?app=messages")!, options: [:])
            }) {
                HStack() {
                    Text("Download iMessage stickers")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .padding(.leading)
                    Image(systemName: "square.and.arrow.down.on.square")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .padding(.vertical)
                        .padding(.trailing)
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: 
                [Color(red: 0.925, green: 0.345, blue: 0.514),
                 Color(red: 0.69, green: 0.153, blue: 0.29)]), 
                                       startPoint: .top, endPoint: .bottom))
                .cornerRadius(4)
                .padding(.horizontal)
            
            Spacer()
            
            Text(isLargerScreen ? "All proceeds will be split 50/50 between the World Health Organization's COVID-19 Solidarity Response Fund and the Equal Justice Initiative for combatting racial and economic injustice." : "All proceeds will be split 50/50 between the WHO's COVID-19 Solidarity Response Fund and the Equal Justice Initiative.")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .regular, design: .default))
                .padding(.horizontal, 50)
                .padding(.bottom, 10)
            
            HStack() {
                Button(action: { 
                    UIApplication.shared.open(URL(string: "https://www.indiestickerpack.com/faq")!, options: [:])
                }) {
                    Text("FAQ")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold, design: .default))
                }
                .padding()
                Button(action: { 
                    UIApplication.shared.open(URL(string: "mailto:hello@tweetnighthawk.com")!, options: [:])
                }) {
                    Text("Support")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold, design: .default))
                }
                .padding()
                Button(action: { 
                    UIApplication.shared.open(URL(string: "https://www.indiestickerpack.com/privacy-policy")!, options: [:])
                }) {
                    Text("Privacy")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold, design: .default))
                }
                .padding()
            }
        }
        .background(
            ZStack() {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                IconGrid()
                Rectangle()
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6)
            }
        )
    }
}

struct IndieAppPack_Previews: PreviewProvider {
    static var previews: some View {
        IndieAppPack()
    }
}
