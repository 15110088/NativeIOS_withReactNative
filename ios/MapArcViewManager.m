//
//  MapArcViewManager.m
//  nativeIOS
//
//  Created by dinh tho on 9/30/20.
//

#import "React/RCTViewManager.h"
@interface RCT_EXTERN_MODULE(MapArcViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(onUpdate, RCTDirectEventBlock)
RCT_EXTERN_METHOD(
  updateFromManager:(nonnull NSNumber *)node
  count:(nonnull NSNumber *)count
)

@end
