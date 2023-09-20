# Appodeal-Test-Repo
This repo is used to store my code for the Appodeal's technical assignment.

The main goald of this assignment to familiarize yourself with teh Appodeal's SDK for iOS, as well as integrate it into a single screen app that must have the following features:
1. The "banners" button presents a banner on top the screen. The max amount of banners that can be presented is 5. Also, the banner has to be hidden once any other type of ad is presented.
2. The "interstitials" button presents a full screen ad. The button must be tappable only in case the required ad has been loaded, as well as only once in 60 seconds. When the interstitial cannot be presented, the button must be disabled.
3. The "rewarded video" button presents a "rewarded video". The max amount fo rewarded videos is 3. When the rewarded video cannot be presented, the button must be inactive.
4. The "native" button presents a list of native UI elements, that contains both regual views and advertisement views.

## Key points
1. All constants related to maxDisplay count, time pause for interstitials are stored in AdContstants class.
2. All data related to fetching / showing / hiding ads is stored in AdProvider.
3. The news feed element is represented by the FeedEntiy abstraction, that stores an ad or an actul data for the list element in it's data property.

## Screenshots & GIFs
| Portrait orientation + console output |
| -------- |
| <video src="https://github.com/maksim-mitrofanov/Appodeal-Test-Repo/assets/87092187/7eba0dcc-a36e-40aa-a1ba-c86eaffb5e0b"> |

| Landscape orientation|
| -------- |
| <video src="https://github.com/maksim-mitrofanov/Appodeal-Test-Repo/assets/87092187/5e2ba574-5304-496a-ac7b-c8fcba29f5b3"> |







