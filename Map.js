import React, { Component } from "react";
import PropTypes from "prop-types";
import {
  requireNativeComponent,
  UIManager,
  findNodeHandle
} from "react-native";
const COMPONENT_NAME = "MapArcView";
const RNCounterView = requireNativeComponent(COMPONENT_NAME);

export default class Map extends Component {
   _onUpdate = event => {
    if (this.props.onUpdate) {
      this.props.onUpdate(event);
    }
    };
    render() {
      const {style } = this.props;

      return (
        <RNCounterView   onUpdate={this._onUpdate}  style={style } />
      );
    }
  }