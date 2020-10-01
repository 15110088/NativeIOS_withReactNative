import React, { Component } from "react";
import PropTypes from "prop-types";
import {
  requireNativeComponent,
  UIManager,
  findNodeHandle
} from "react-native";
const COMPONENT_NAME = "MapArc";
const RNCounterView = requireNativeComponent(COMPONENT_NAME);

export default class Map extends Component {
    render() {
      return (
        <RNCounterView   />
      );
    }
  }