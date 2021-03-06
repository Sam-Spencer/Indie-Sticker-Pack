//
//  ArrayChunker.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/17/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import Foundation

internal extension Array {
    
    func chunked(into size:Int) -> [[Element]] {
        var chunkedArray = [[Element]]()
        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]))
            } else if(index == self.count) {
                chunkedArray.append(Array(self[index - 1..<index]))
            }
        }
        
        return chunkedArray
    }
    
}
