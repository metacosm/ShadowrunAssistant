//
//  Created by claprun on 11/9/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRATestContext.h"


@implementation SRATestContext {
  int _threshold;
  BOOL _edge;
}

- (int)bonus {
  return 0;
}

- (int)malus {
  return 0;
}

- (int)threshold {
  return _threshold;
}

- (void)setThreshold:(int)threshold {
  _threshold = threshold;
}

- (BOOL)edge {
  return _edge;
}

- (void)useEdge:(BOOL)useEdge {
  _edge = useEdge;
}


@end