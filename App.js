import React from 'react';
import {View, Text, Button, NativeModules} from 'react-native';

const { SwiftComponentManager } = NativeModules

const App = () => {
	const pressMe = () => {
		SwiftComponentManager.passValueFromReact('Hello World')
	}

	const registerApp = () => {
		SwiftComponentManager.registerApp().then((response) => {
			console.log('response: ', response);
		})
	}
	return (
		<View
			style={{
				flex: 1,
				justifyContent: 'center',
				alignItems: 'center',
				backgroundColor: 'lightgray',
			}}>
			<Text>Hello Mini2App</Text>
			<Button title="Press Me" onPress={pressMe} />
			<Button title="Register App" onPress={registerApp} />
		</View>
	);
};

export default App;
