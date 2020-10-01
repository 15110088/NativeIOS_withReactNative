import React, { Component } from 'react';
import { View, 
  Text,
  TouchableOpacity ,
  StyleSheet,
  requireNativeComponent,
  UIManager,
  findNodeHandle

} from 'react-native';
//import CounterView from './CounterView'
// import Map   from './Map'


const RNCounterView = requireNativeComponent("MapArcView");

  class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 1

    };
  }
  // update = e => {
  //   this.setState({
  //     count: e.nativeEvent.count
  //   })
  // }


  increment = () => {
    this.setState({ count: this.state.count + 1 })
  }

  // updateNative = () => {
  //   UIManager.dispatchViewManagerCommand(
  //     findNodeHandle(this.counterRef),                     // 1
  //     UIManager["CounterView"].Commands.updateFromManager, // 2
  //     [this.state.count]                                   // 3
  //   );
  // }


  update = e => {
    this.setState({ count: e.count })
  };

  updateNative = () => {
    this.counterRef.update(this.state.count);
  };

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity   
          onLongPress={this.updateNative}// truyền event từ reaect -> native
          style={[styles.wrapper, styles.border]}
          onPress={this.increment}
        >    
          <Text style={styles.button}>
            {this.state.count}
          </Text>
          
        </TouchableOpacity>
        {/* <CounterView
          style={ styles.wrapper }
          count={2}  // truyền props vào native 
          ref={e => this.counterRef = e} // khai báo để truyền data reaect -> native
          onUpdate={this.update}  // truyền event từ  native -> react 
        /> */}
     <RNCounterView  style={ styles.wrapper }/>
      </View>
    );  
  }
}
const styles = StyleSheet.create({
  container: {
    flex: 1, alignItems: "stretch"
  },
  wrapper: {
    flex: 1, alignItems: "center", justifyContent: "center"
  },
  border: {
    borderColor: "#eee", borderBottomWidth: 1
  },
  button: {
    fontSize: 50, color: "orange"
  }
});
export default App;
