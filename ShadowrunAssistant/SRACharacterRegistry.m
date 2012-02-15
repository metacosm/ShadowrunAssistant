//
//  Created by claprun on 1/7/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacterRegistry.h"
#import "SRACharacter.h"
#import "SRAEngine.h"

@implementation SRACharacterRegistry {
}

@synthesize engine = _engine;


- (SRACharacterRegistry *)initWithEngine:(SRAEngine *)engine {
  self = [super init];
  if (self) {
    _engine = engine;
  }
  return self;
}

- (SRACharacter *)characterNamed:(NSString const *)name {
  return [[SRACharacter alloc] initWithName:name engine:NULL];

}
@end