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
  
  @objc func updateFromManager(_ node: NSNumber, count: NSNumber) {
   // Truyền dữ liệu từ react sang native.  count là giá trị truyền vào
   // truyên vào hàm update trong CuonterView
   // hàm nầy sẽ lấy giá trị set vào lable
    DispatchQueue.main.async {                               // 2
      let component = self.bridge.uiManager.view(            // 3
        forReactTag: node                                    // 4
      ) as! MapArcView                                       // 5
      component.updateTitle(value: count)                    // 6
    }
  }

}
