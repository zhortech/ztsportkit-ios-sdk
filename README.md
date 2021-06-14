# ZTSportKit

[![Platforms](https://img.shields.io/cocoapods/p/ZTSportKit.svg)](https://cocoapods.org/pods/ZTSportKit)
[![License](https://img.shields.io/cocoapods/l/ZTSportKit.svg)](https://raw.githubusercontent.com/zhortech/ztsportkit-ios-sdk/main/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/ZTSportKit.svg)](https://cocoapods.org/pods/ZTSportKit)

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 13.0+
- Xcode 11.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate ZTSportKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '13.0'
use_frameworks!

pod 'ZTSportKit', :git => "https://github.com/zhortech/ztsportkit-ios-sdk.git"
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use ZTSportKit as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZTSportKit",
    dependencies: [
        .package(url: "https://github.com/zhortech/ztsportkit-ios-sdk.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        .target(name: "ZTSportKit", dependencies: ["ZTSportKit"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ZTSportKit into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add ZTSportKit as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/zhortech/ztsportkit-ios-sdk.git
$ git submodule update --init --recursive
```

- Open the new `ZTSportKit` folder, and drag the `ZTSportKit.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `ZTSportKit.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `ZTSportKit.xcodeproj` folders each with two different versions of the `ZTSportKit.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `ZTSportKit.framework`.

- And that's it!

> The `ZTSportKit.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/zhortech/ztsportkit-ios-sdk/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `ZTSportKit.framework`.
- And that's it!

</p></details>

## Usage

### Product setup
It is required to set mode type `ZTActivityMode` before starting activity so activity will use corresponding algorithm.

public func setMode(mode: ZTActivityMode, completion: @escaping ZTBaseResult) {

```swift
ZTSport.shared.setMode(mode: .running) { (error) in
    debugPrint("Error setting mode to running: \(error.localizedDescription)")
}
```

### Activity Start

To start activity first set user parameters:
```swift
let userDataParameters = ZTUserDataParameters(bodyWeight: 80, bodyHeight: 185, shoeSize: 44)

ZTSport.shared.setUserParameters(parameters: userDataParameters, completion: { (error) in
    if let error = error {
        debugPrint("Error setting userParameters: \(error.localizedDescription)")
    }
})
```
Next, subscribe to activity state change
```swift
ZTSport.shared.onActivityStateChange.subscribeOnce(with: self) { (activityId, actualState, error) in
    debugPrint("onActivityStateChange - activityId: \(activityId ?? " -- "), state: \(actualState), error: \(error?.localizedDescription ?? "")")
}
```
And finally call start activity with chosen goal
```swift
ZTSport.shared.startActivity(goal: ZTSport.ActivityGoal.distance, goalValue: 200)
```

### Activity stop. 
Activity can be stopped calling `stopActivity()`. 
Initially subscribe to activity stopped event
```swifft

ZTSport.shared.onActivityStopped.subscribeOnce(with: self) { (activityId, actualState, error) in
    debugPrint("Activity stopped with activityId: \(activityId ?? ""), state: \(actualState), error: \(error?.localizedDescription ?? "")")
}
```
And finally call stop activity
```swift

ZTSport.shared.stopActivity()
```
Activity can be also stopped automatically because of idle state and insoles went into sleep mode or battery low level. 
You should subscribe for this event to be notified:
```swift
ZTSport.shared.onActivityRestoreStarted.subscribe(with: self) { (wasRestored) in
    debugPrint("Previous activity restored: \(wasRestored)")
}
```
### Activity data

### Realtime data
To request activity data in real time use:
```swift
val fields = list of desired fields
ZTApi.shared.getActivityRealtimeData(activityId: activityId,fields: ["steps_count, "cadence_avg", "activity_time"]) { response, error in
    debugPrint(String(describing: response))
}
```

### Application data
You can provide application data like gps coordinates or other information for current activity calling:
```swift

//e.g. let data = [timestamp, latitude, longitude]
ZTSport.shared.addActivityData(timestamp: timestamp, data: data) { error in
    if error != nil {
        debugPrint("addActivityData error - \(String(describing: error))")
    }
}
```


#### Summary
Activity summary can be received with additional fields or informationafter after activity is stopped. 

```swift
let fields: [ZTSportActivity.Field] = [.steps_count, .cadence_avg, .activity_time]
let include: [String] = ["attributes.activityTitle"]
ZTSport.shared.getActivitySummary(activityId, fields, include){ activity, error in
    debugPrint("activity: \(String(describing: activity))")
}
```
Where fields is array of of type `ZTSportActivity.Field` and include is array of additional attributes which can be checked in ZCloud documentation.

## Author

ZhorTech [@zhortech](https://twitter.com/zhortech)

## License

ZTSportKit is released under the MIT license. See [LICENSE](https://github.com/zhortech/ztsportkit-ios-sdk.git/blob/master/LICENSE) for details.
