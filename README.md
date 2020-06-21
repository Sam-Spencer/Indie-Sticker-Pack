# Indie Sticker Pack

Get a limited-time sticker pack from your favorite indie iOS apps. Give back to our global community.

Developers participating in this initiative ([learn more](https://www.indiestickerpack.com)) can essentially drag-and-drop a pre-fab IndieStickerPack View into their projects to inform users and direct them to purchase and donation options.

Getting everything setup and integrated is simple and should only take a few minutes.

<img src="https://uploads-ssl.webflow.com/5ec8898006d25c90610c6a0b/5ee5404db15d0580e02569e8_Open%20Graph%20Art.png" width=100%/>

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

## Making it through App Review

App Review with charitable donations can be tricky. Thankfully, I've recieved from guidance straight from the App Store review team on this. When submitting, be mindful of **Guideline 3.2.2**:

> ...collecting funds within the app for charities and fundraisers. Apps that seek to raise money for such causes must be free on the App Store and may only collect funds **outside** of the app, such as **via Safari** or SMS.

In plain terms this means you should / shouldn't do the following:

1. Make **no** specific claims about charities or proceeds in your app binary or metadata. For example, you are **not** allowed to say "100% of proceeds go to WHO and EJI". What *is* acceptable is a more *general* statement such as: "Do good", or "Support your global community". The strings written in this repo should already comply with the guidelines.
2. Do not provide discounts on existing in-app purchases, rebates, or discounts on app costs that are in any way tied to this project.
3. *Do* mention how your app is included in the Indie Sticker Pack in your app's promotional text.
4. *Do* use the included links to forward users to Safari for more information.
5. Do **not** be annoying in your display of this content.
