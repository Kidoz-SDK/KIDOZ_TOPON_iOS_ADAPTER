


# KIDOZ_TOPON_ADAPTER_iOS
Kidoz TopOn mediation adapter Version 1.0 
Built and tested with TopOn SDK v5.7.3

</br>

**Prerequisits:**
* To use the Kidoz SDK adapter for TopOn you should make sure you have:
1. TopOn SDK integrated in your project as explained [HERE](https://docs.toponad.com/#/en-us/ios/GetStarted/TopOn_Get_Started):
2. A fully functional TopOn ad placement.
3. Kidoz SDK built with your project.

**Integration Steps:**

* Drag and drop the `libKidozSDK.a` and the `libKidozTopOnAdapter.a` from the sample app to your project.
* Select your target in the project navigator, select the “Build Settings” tab, search for “Other Linker Flags”, click on the “+” and type -ObjC  `Other Linker Flags -ObjC`  .
<a href="url"><img src="https://cdn.kidoz.net/sdk/ios/KidozSdkSampleApp3.png" align="center"  ></a>

* In the  `info.plist`  add  `NSAppTransportSecurity`  exception with  `NSAllowsArbitraryLoads`exception  
`<key>NSAppTransportSecurity</key>`  
`<dict>`  
`<key>NSAllowsArbitraryLoads</key>`  
`<true/>`  
`</dict>`
<a href="url"><img src="https://cdn.kidoz.net/sdk/ios/KidozSdkSampleApp2.png" align="center"  ></a>

Add Custom Network in TopOn's Network , Fill in the Network Name as explained [HERE](https://docs.toponad.com/#/en-us/ios/GetStarted/TopOn_Get_Started):
Fill in the Adapter's Class Name for each ad type :
 
 ```
 Rewarded Video: KidozTopOnMediationRewardedAdapter
 
 Interstitial: KidozTopOnMediationInterstitialAdapter
 
 Banner: KidozTopOnMediationBannerAdapter 
```


<br/>
**Example for adding Custom Network:
</br>

</br>
<a href="url"><img src="https://cdn.kidoz.net/new/sdk/GITHUB_GRAPHICS/KIDOZ_SDK_Documentaions/topon-customnetwork-ios.png" align="left" height="659" width="994" ></a>
</br>


3.7 Add the Ad Sources for Custom Network and fill in the Parameters PublisherId ,PublisherToken and UnitID for each ad type in JSON strings type:
 ```
 {"AppID":"publisherId", "Token":"publisherToken","UnitID":"unitId"}
```

<br/>
**Example for adding the Ad Source:
</br>

</br>
<a href="url"><img src="https://cdn.kidoz.net/new/sdk/GITHUB_GRAPHICS/KIDOZ_SDK_Documentaions/topon-adsource-ios.png" align="left" height="659" width="994" ></a>
</br>

## Important note: ##
While mapping the Kidoz Ad unit on TopOn, it is highly recommended to run some Json validator on the parameters passed to the Custom Network Ad Sources (AppID, Token and UnitID). This method may minimize parsing mistakes that may rise on initial connection.


License
--------

    Copyright 2015 KIDOZ, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

