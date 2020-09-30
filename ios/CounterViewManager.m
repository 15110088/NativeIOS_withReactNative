//
//  CounterViewManager.m
//  nativeIOS
//
//  Created by dinh tho on 9/29/20.
//

#import "React/RCTViewManager.h"
@interface RCT_EXTERN_MODULE(CounterViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(count, NSNumber)
RCT_EXPORT_VIEW_PROPERTY(onUpdate, RCTDirectEventBlock)
RCT_EXTERN_METHOD(
  updateFromManager:(nonnull NSNumber *)node
  count:(nonnull NSNumber *)count
)

@end
