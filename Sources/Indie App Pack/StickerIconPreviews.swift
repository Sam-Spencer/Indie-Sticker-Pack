//
//  StickerIconPreviews.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/17/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import SwiftUI

struct StickerIconPreviews: View {
    
    @State private var opacity = 1.0
    
    var body: some View {
        let chunkedIcons = IndieIconPreviewGenerator.allIcons().chunked(into: 3) 
        
        var previousTableFooter: UIView?
        var previousTableSeparatorStyle: UITableViewCell.SeparatorStyle?
        
        return List {
            ForEach(0..<chunkedIcons.count) { index in
                HStack {
                    ForEach(chunkedIcons[index], id: \.self) { icon in
                        GeometryReader() { reader in
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(reader.size.height * 0.22)
                                .transition(.move(edge: .bottom))
                        }
                        .frame(minWidth: 40, idealWidth: 120, maxWidth: 120, minHeight: 40, idealHeight: 120, maxHeight: 120, alignment: .center)
                        .padding()
                    }
                        .listRowBackground(Color.black)
                }
            }
            .listRowBackground(Color.black)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            // To remove only extra separators below the list:
            previousTableFooter = UITableView.appearance().tableFooterView
            UITableView.appearance().tableFooterView = UIView()
            
            // To remove all separators including the actual ones:
            previousTableSeparatorStyle = UITableView.appearance().separatorStyle
            UITableView.appearance().separatorStyle = .none
        }
        .onDisappear {
            UITableView.appearance().tableFooterView = previousTableFooter
            UITableView.appearance().separatorStyle = previousTableSeparatorStyle ?? .singleLine
        }
    }
    
}

struct StickerIconPreviews_Previews: PreviewProvider {
    static var previews: some View {
        StickerIconPreviews()
    }
}
