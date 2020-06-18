//
//  PreviewGenerator.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/17/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import Foundation
import UIKit

internal class IndieIconPreviewGenerator {
    
    class func allIcons() -> [String] {
        var iconNames: [String] = []
        for index in 1...112 {
            iconNames.append(NSNumber(value: index).stringValue)
        }
        return iconNames
    }
    
    static var isLargerScreen: Bool {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return true
        } else {
            return false
        }
    }
    
}
