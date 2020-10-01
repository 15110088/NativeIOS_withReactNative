//
//  MapArcViewManager.swift
//  nativeIOS
//
//  Created by dinh tho on 9/30/20.
//

import Foundation
import ArcGIS

@objc(MapArcViewManager)
class MapArcViewManager: RCTViewManager {
  override func view() -> UIView! {
   
    return  MapArcView()
  }
  
  @objc override static func requiresMainQueueSetup() -> Bool {
      return false
  }

}
