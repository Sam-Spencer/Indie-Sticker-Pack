# Indie Sticker Pack

Get a limited-time sticker pack from your favorite indie iOS apps. Give back to our global community.

Developers participating in this initiative ([learn more](https://www.indiestickerpack.com)) can essentially drag-and-drop a pre-fab IndieStickerPack View into their projects to inform users and direct them to purchase and donation options.

Getting setup everything integrated is simple and should only take a few minutes.

## Integration

There are two integration options: **SwiftUI** or **UIKit**. Currently, the **SwiftUI** implementation is complete and can be quickly added to any point in an app. **UIKit** support is coming quickly. Here's how you can use either approach.

### SwiftUI
 1. Copy contents of the `Sources` folder into your app's project.  
 2. Delete the `UIKit` folder.
 3. Somewhere in your app, display the `GiveBack` View. `GiveBack` is a rounded rectangle button that reads ""Give back and get stickers" with a heart next to it. When a user taps on the view, they'll be modally presented with the pre-fab Indie Sticker Pack View. 
 4. If you so choose, you can optionally set a custom `action` on the `GiveBack` View. Or you can just present the `IndieAppPack` View directly.
 
**Requirements**
 - SwiftUI support in your app, thus iOS 13.0 or later.
 
### UIKit
 1. Copy contents of the `Sources` folder into your app's project.  
 2. Delete the `SwiftUI` folder.
 3. Somewhere in your app, display the `IndieStickerView` UIView.
