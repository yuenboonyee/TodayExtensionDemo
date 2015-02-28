This demo illustrates how to create a 'Today' iOS extension with data sharing between the extension and the container app.
The demo displays a 3x3 grid of buttons. When a button is tapped, it's state toggles between full and half alpha brightness. The button states should be the same between the container app and the Today view.

Xcode version: 6.3 Beta.

Technique:
To enable data sharing, use Xcode or the Developer portal to enable app groups for the containing app and its contained app extensions.
Next, register the app group in the portal and specify the app group to use in the containing app. To learn about working with app groups, see Adding an App to an App Group in Entitlement Key Reference .
After you enable app groups, an app extension and its containing app can both use the NSUserDefaults API to share access to user preferences. To enable this sharing, use the initWithSuiteName: method to instantiate a new NSUserDefaults object, passing in the identifier of the shared group. For example, a Share extension might update the user’s most recently used sharing account, using code like this:
￼￼
// Create and share access to an NSUserDefaults object
NSUserDefaults *mySharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:
@"com.example.domain.MyShareExtension"];
// Use the shared user defaults object to update the user's account
[mySharedDefaults setObject:theAccountName forKey:@"lastAccountName"];


References:
Apple's 'App Extension Programming Guide' (2 Feb 2015) - Sharing data with Your Containing App
    - https://developer.apple.com/library/mac/documentation/General/Conceptual/ExtensibilityPG/index.html

How to create iOS 8 Today extension and share data with containing app – tutorial
    - http://www.glimsoft.com/06/28/ios-8-today-extension-tutorial/