# Changelog

## [1.1.27](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.26) (2022-09-15)

- tweak for raw data upload

## [1.1.25](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.25) (2022-06-15)

- fix for raw data flow

## [1.1.22](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.22) (2022-05-19)

- fix for scanning in raw data mode 

## [1.1.21](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.21) (2022-05-04)

- refactoring raw data mode

## [1.1.20](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.20) (2022-05-04)

- using mac address for connection in raw data mode

## [1.1.19](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.19) (2022-04-29)

- ZTSamplingMode parameter added to start activity for universal firmware

## [1.1.18](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.18) (2022-04-12)

- cleaning code

## [1.1.17](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.17) (2022-03-10)

- refactoring

## [1.1.14](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.14) (2022-03-08)

- fixed `setMode` method to return correct errors

## [1.1.13](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.13) (2022-03-07)

- refactored activity start & stop

## [1.1.12](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.12) (2022-02-10)

- fixed `import Foundation` and added more logs for logLevel = .debug

## [1.1.11](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.11) (2021-12-14)

- added support for universal firmware
- added parameter `enableRawData` to start activity with raw data recording
- raw data is automatically uploaded to ZCloud API
- progress and current state of raw data flow can be observed in `ZTSport.shared.onRawDataFlowProgresss` and `ZTSport.shared.onRawDataFlowStateChange`

## [1.1.10](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.10) (2021-11-25)

- changed parameters for methods `getActivitySummary` and `getActivitiesSummary`
- updated chunks timestamp variable type

## [1.1.9](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.9) (2021-10-04)

-  allow custom attributes to start activity in method `startActivity(attributes:,userParameters:,completion:)`
- added additional parameters to `getActivitySummary` and `getActivitiesSummary` methods: `where`,  `duration`, `start`, `stop` 
- added new method `getAnalysisSqiOptimisation(activityId:,targetSQI:,completion:` to get analysis sqi optimisation

## [1.1.8](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.8) (2021-10-01)

-  using `ZTSettings.shared.chunkDuration` for activity

## [1.1.7](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.7) (2021-09-27)

-  added new method `func forceStop(completion:)` to force activity stop

## [1.1.6](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.6) (2021-09-17)

-  Changed `onActivityInfoUpdated` observer to parse activity mode

## [1.1.5](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.5) (2021-09-03)

-  Changed flow to pass  `ZTUserDataParameters` so failure will also have callback.

## [1.1.4](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.4)  (2021-09-01)

-  Changed parameter  `ZTUserDataParameters` to be optional to start activity. Application is responsible to pass `ZTUserDataParameters` only for running algo.

## [1.1.3](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.3)  (2021-08-31)

- Added new parameter `ZTUserDataParameters` which is required to start new activity
- Refactored observers for `ZTDevice`

## [1.1.2](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.2) (2021-07-27)

- Refactoring to support changes in ZTCoreKit

## [1.1.1](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.1) (2021-07-22)

- Improved logging for `.debug` mode

## [1.1.0](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.1.0) (2021-07-20)

- Added callback to `startActivity` method - `startActivity(goal: ZTSport.ActivityGoal, goalValue: Double, completion:((activityId?, ZTError?) -> Void)?)` 
- Added callback to  `stopActivity` method - `stopActivity(completion:((activityId?, ZTError?) -> Void)?)`
- Old methods `startActivity` and `stopActivity` are deprecated. 

## [1.0.55](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.0.55) (2021-07-08)

- Added recommendations for `strike` in activity analysis.
- Added `cadence` object in activity analysis.

## [1.0.54](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.0.54) (2021-07-05)

- Added support for `Speed distance category` for `SQIV2` in activity analysis.

## [1.0.53](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.0.53) (2021-06-25)

- Added support for `Stride Quality Index V2`. It can be obtained in 'ZTSport.shared.getActivityRunAnalysis'.

## [1.0.52](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.0.52) (2021-06-18)

- Added support for `SQIV2`. It can be obtained in run analysis in field `strideQualityIndexV2`.

## [1.0.51](https://github.com/zhortech/ztsportkit-ios-sdk.git/-/tags/1.0.51) (2021-06-14)

- Compiled framework distribution

## [1.0.50](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.50) (2021-05-27)

- refactored `stop` activity flow to obtain and recheck activity segments. Segments are obtained after activity is stopped and sent in `activity/stop` endpoint request.    [\#RUN-1710](https://zhortech.atlassian.net/browse/RUN-1710)

## [1.0.49](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.49) (2021-05-24)

- Addition to `stop` activity flow to obtain and recheck activity segments.  [\#RUN-1710](https://zhortech.atlassian.net/browse/RUN-1710)

## [1.0.48](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.48) (2021-04-22)

- Added support for realtime activity data [\#RUN-1679](https://zhortech.atlassian.net/browse/RUN-1679)

## [1.0.40](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.40) (2021-04-07)

- New observer added `onActivityStopRequestSent` which is called when request was sent to ZCloud endpoint `activity/stop`

## [1.0.38](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.38) (2021-03-31)

- Changed flow to send activity segments [\#RUN-1571](https://zhortech.atlassian.net/browse/RUN-1571)

## [1.0.35](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.35) (2021-03-22)

- Added support for Swift Package Manager (SPM)

## [1.0.34](https://github.com/zhortech/ztsportkit-ios-sdk/-/tags/1.0.34) (2021-03-19)

- Updated libraries and set minimum iOS version to 13 [\#RUN-1504](https://zhortech.atlassian.net/browse/RUN-1504) 
