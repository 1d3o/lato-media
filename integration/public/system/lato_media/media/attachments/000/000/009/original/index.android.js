import { AppRegistry, AsyncStorage } from 'react-native'
import Root from './src/root'

// AsyncStorage.clear()

console.disableYellowBox = true

AppRegistry.registerComponent('PioveGovernoLadro', () => Root)
