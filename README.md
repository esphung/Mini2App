# Mini 2 App

#### Author:
Eric Phung

#### Setup Commands:
```bash
# clone repo

# install node modules
yarn

# install pods
npx pod-install

# start metro js bundler
react-native start --reset-cache

# run app on simulator
react-native run-ios --simulator="iPhone 13"

# open xcode workspace
xed -b ios

# mainjsbundle
react-native bundle --entry-file='index.js' --bundle-output='./ios/main.jsbundle' --dev=false --platform='ios' --assets-dest='./ios'
```
