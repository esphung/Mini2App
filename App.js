import React, {useState, useEffect} from 'react';
import {View, Text, Button, NativeModules} from 'react-native';

const { SwiftComponentManager } = NativeModules

const App = (props) => {
	// props from Xcode
	// console.log('props: ', props);

	const [isRegistered, setIsRegistered] = useState(false);
	const [isLoggedIn, setIsLoggedIn] = useState(false);

	const pressMe = () => {
		SwiftComponentManager.passValueFromReact('Hello World')
	}

	const registerApp = () => {
		SwiftComponentManager.registerApp((err, response) => {
			if (err) {
				// statement
				console.error('err: ', err);
			} else {
				console.log('response: ', response);
				setIsRegistered(response.success);
			}
		});

		// SwiftComponentManager.simpleMethod('hi');
		// SwiftComponentManager.callbackMethod((err, response) => console.log({response}));
	}

	const onLoginClick = () => {
		SwiftComponentManager.onLoginClick((err, response) => {
			if (err) {
				// statement
				console.error('err: ', err);
			} else {
				console.log('response: ', response);
				setIsLoggedIn(true);
			}
		});
	}

	return (
		<View
			style={{
				flex: 1,
				justifyContent: 'center',
				alignItems: 'center',
				backgroundColor: 'papayawhip',
			}}>
			<Text>Hello Mini2App</Text>
			<Button title="Press Me" onPress={pressMe} />
			<Button title="Register App" onPress={registerApp} />
			<Button disabled={!isRegistered} title="User Click Login" onPress={onLoginClick} />
		</View>
	);
};

export default App;
