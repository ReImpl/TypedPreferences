
[![Version](https://img.shields.io/cocoapods/v/TypedPreferences.svg?style=flat)](https://cocoapods.org/pods/TypedPreferences)
[![License](https://img.shields.io/cocoapods/l/TypedPreferences.svg?style=flat)](https://cocoapods.org/pods/TypedPreferences)
[![Platform](https://img.shields.io/cocoapods/p/TypedPreferences.svg?style=flat)](https://cocoapods.org/pods/TypedPreferences)

## Description

UserDefaults interface is not strictly-typed.
TypedPreferences enables class implementation where all dynamic @objc-declared properties are automatically saved/loaded to/from UserDefaults.

Thus:
```swift
// Instead of:
let defaults = UserDefaults.standard
print("name: \(defaults.value(forKey: "name") as? String)")
defaults.set("Updated name", forKey: "name")

// Typed property-based usage looks like:
let preferences = YourPreferencesSubclass()
print("name: \(preferences.name)")
preferences.name = "Updated name"
```

## Installation

TypedPreferences is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TypedPreferences'
```

## License

TypedPreferences is available under the MIT license. See the LICENSE file for more info.
