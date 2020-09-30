//
//  CounterViewManager.swift
//  nativeIOS
//
//  Created by dinh tho on 9/29/20.
//

import Foundation
@objc(CounterViewManager)
class CounterViewManager: RCTViewManager {
//  override func view() -> UIView! {
//    let label = UILabel()
//    label.text = "Swift Counter"
//    label.textAlignment = .center
//    return label
//  }
  override func view() -> UIView! {
      return CounterView()
    }
  
  // 1
   @objc func updateFromManager(_ node: NSNumber, count: NSNumber) {
    // Truyền dữ liệu từ react sang native.  count là giá trị truyền vào
    // truyên vào hàm update trong CuonterView
    // hàm nầy sẽ lấy giá trị set vào lable
     DispatchQueue.main.async {                                // 2
       let component = self.bridge.uiManager.view(             // 3
         forReactTag: node                                     // 4
       ) as! CounterView                                       // 5
       component.update(value: count)                          // 6
     }
   }

  
  
  @objc override static func requiresMainQueueSetup() -> Bool {
      return false
  }

}
