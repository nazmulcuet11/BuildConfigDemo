# BuildConfigDemo

This project demonstrates how to use Xcode Build Configuration (.xcconfig) files to easily manage iOS project environments.
<br>

`.xcconfig` helps to easily define differetn configuration varialbles for different enviorment. Just create `.xcconfig` file using `New File -> Configuration Strings file` in Xcode.

-   Choose the appropriate `.xcconfig` in Configuarations section in `Project -> Info` tab
-   Define build related configuration (like `PRODUCT_NAME`, `ASSETCATALOG_COMPILER_APPICON_NAME`, `PRODUCT_BUNDLE_IDENTIFIER`) in `.xcconfig` file so that this information is available to XCode when building our product.
-   Define app related configuration (like base api urls, api keys) specially secret configuration (like API Keys) in a swift file because configuration defined in `.xcconfig` can be easily extracted from `Info.plist` files when app is downloaded from AppStore and thus creates security risk. Checkout `Configuration.swift` file to better understand how this done. Note that a new key is added in `Info.plist` named `Configuration` which essentialy represents current confugration `$(CONFIGURATION)` and swift code is reading value for `Configuration` key from `Info.plist` file to figure out current configuration.
-   Do not forget to remove configuaration that is defined in `.xconfig` file from projects and targets build settings (if defined statically) so that they get the configuaration from `.xcconfig` files.

![alt text](https://github.com/nazmulcuet11/BuildConfigDemo/blob/main/screenshot_1.png?raw=true)

-   Note that you can apply `.xcconfig` to project level or target level. But applying to target is not recomended as `Cocoapod` applies its configuaration at target level.

### Useful links

1. https://cocoacasts.com/tips-and-tricks-managing-build-configurations-in-xocde
2. https://nshipster.com/xcconfig/
3. https://www.appcoda.com/xcconfig-guide/
4. https://www.appcoda.com/using-xcode-targets
