//
//  CounterView.swift
//  nativeIOS
//
//  Created by dinh tho on 9/29/20.
//

import UIKit

class CounterView: UIView {
  @objc var onUpdate: RCTDirectEventBlock?

  @objc var count: NSNumber = 0 {// truyền props nên phải khái báo nsNumber
     didSet {
       button.setTitle(String(describing: count), for: .normal)
     }
   }
   override init(frame: CGRect) {
     super.init(frame: frame)
     self.addSubview(button)
     increment()
   }
   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
   lazy var button: UIButton = {
     let b = UIButton.init(type: UIButton.ButtonType.system)
     b.titleLabel?.font = UIFont.systemFont(ofSize: 50)
     b.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     b.addTarget(
       self,
       action: #selector(increment),
       for: .touchUpInside
     )
    let longPress = UILongPressGestureRecognizer(
      target: self,
      action: #selector(sendUpdate(_:))
    )
        b.addGestureRecognizer(longPress)

     return b
   }()
  @objc func sendUpdate(_ gesture: UILongPressGestureRecognizer) {// truyền sự kiên biến  count qua react native  khi long press
     if gesture.state == .began {
       if onUpdate != nil {
         onUpdate!(["count": count])// trên react. dùng e.nativeEvent.count để lấy biến count
       }
     }
   }
   @objc func increment() {
    count = count.intValue + 1 as NSNumber
   }
  
  @objc func update(value: NSNumber) {
     count = value
   }
  
 

}
