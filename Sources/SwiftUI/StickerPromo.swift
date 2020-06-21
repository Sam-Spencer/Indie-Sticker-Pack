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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack() {
            Button(action: { 
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.compact.down")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .semibold, design: .default))
                    .opacity(0.8)
            }
            .padding(.top, 20)
            
            HStack(alignment: .bottom) {
                Image("StickerPackIcon").resizable()
                    .padding()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(minWidth: 56, idealWidth: 80, maxWidth: 110, minHeight: 56, idealHeight: 80, maxHeight: 110, alignment: .leading)
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            
            Text("Get a limited-time sticker pack from your favorite indie iOS apps.\n\nDo good for our global community.")
                .foregroundColor(.white)
                .font(.system(size: (IndieIconPreviewGenerator.isLargerScreen ? 56 : 30), weight: .heavy, design: .default))
                .lineSpacing(5)
                .padding()
                .padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
            
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
