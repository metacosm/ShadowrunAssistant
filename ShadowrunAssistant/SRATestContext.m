//
//  Created by claprun on 11/9/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRATestContext.h"
#import "SRACharacter.h"


@implementation SRATestContext {
  int _threshold;
  BOOL _edge;
}

- (int)bonusFor:(SRACharacter *)character {
  return 0;
}

- (int)malusFor:(SRACharacter *)character {
  return 0;
}

- (int)thresholdFor:(SRACharacter *)character {
  return _threshold;
}

- (void)setThreshold:(int)threshold for:(SRACharacter *)character {
  _threshold = threshold;
}

- (BOOL)edgeFor:(SRACharacter *)character {
  return _edge;
}

- (void)useEdge:(BOOL)useEdge for:(SRACharacter *)character {
  _edge = useEdge;
}


@end