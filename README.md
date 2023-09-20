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




# Writing assignment
Hello, Client!
 
Thank's for reaching out to our technical support team, my name is Maksim and I will do my best to help you fix the issue you’ve described. 

Regarding the email that you’ve received from Google Play, it’s important to remember that Google Corporation has several rules, policies, and best practices that all apps published in Google Play should follow. It seems to me that the reason why you’ve received the email is because Google is trying to maintain the overall positive user experience and based on their rules, showing interstitial ads is only allowed after a user performs an action with a clear intent. 
 
 In other words, the user has to first tap on some kind of button, or banner, or finish performing some action before the ad can be presented. 

One way of fixing this issue is to add some kind of button and make sure that the interstitial ads are only presented when this button gets pressed. By doing so, we ensure that the user is never interrupted, or as the email said: «focused on a task at hand».
 
 Another possible solution could be to present the interstitial ads after the user has finished performing some kind of action «e.g. playing a game, filling out a form, reading content». For example, when the user fills out a form and presses the primary action button (continue, next or something else), we could present the interstitial ad before moving to the next step.
The presentation of the interstitial ads can be easily changed via the AdverisingProvider class and its methods like .presentInterstitial, .interstitialDidLoadAdIsPrecache, etc. 
 
 I hope that this clarifies the issue, as well as gives you possible strategies for fixing it. In case you have any other questions left, please don’t hesitate to ask me.
 
 Also, in case it is possible to share some of the files from your project, you can share them with me so I can try to fix this issue for you.
 
 Kind regards,
 Maksim.






