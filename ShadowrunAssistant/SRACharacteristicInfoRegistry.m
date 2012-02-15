//
//  Created by claprun on 2/12/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristicInfoRegistry.h"
#import "SRACharacteristicInfo.h"
#import "SRASkillInfo.h"
#import "SRAEngine.h"
#import "SRACharacteristicType.h"


@implementation SRACharacteristicInfoRegistry {

}
@synthesize engine = _engine;


- (SRACharacteristicInfoRegistry *)initWithEngine:(SRAEngine *)engine {
  self = [super init];
  if (self) {
    _engine = engine;
  }
  return self;

}

- (SRASkillInfo *)skillNamed:(NSString const *)name {
  return nil;

}

- (SRACharacteristicInfo *)characteristicInfoNamed:(NSString const *)name {
  NSArray *attributes = [_engine supportedAttributes];
  SRACharacteristicType *type;
  if ([attributes containsObject:name]) {
    type = [SRACharacteristicType attribute];
  }
  else {
    type = [SRACharacteristicType skill];
  }
  return [SRACharacteristicInfo characteristicInfoNamed:name typed:type];

}
@end