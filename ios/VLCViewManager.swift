//
//  VLCViewManager.swift
//  nativeIOS
//
//  Created by dinh tho on 10/1/20.
//

import Foundation
@objc(VLCViewManager)
class VLCViewManager: RCTViewManager {
  var label :UILabel={
   let  b:UILabel = UILabel();
   b.text = "Swift Counter"
   b.textAlignment = .center
   b.autoresizingMask = [.flexibleWidth, .flexibleHeight]
   return b
   }();
  override func view() -> UIView! {
   
    return  label
  }
  
  @objc override static func requiresMainQueueSetup() -> Bool {
      return false
  }
  
  

}
