//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristicType.h"

@interface SRACharacteristicType ()
- (id)initWithName:(NSString *)aName;
@end


@implementation SRACharacteristicType {
}

@synthesize name = _name;

static SRACharacteristicType *_attribute;
static SRACharacteristicType *_skill;

// override to prevent direct instantiation
- (id)init {
  [self doesNotRecognizeSelector:_cmd];
  return nil;

}

+ (void)initialize {
  static BOOL initialized = NO;
  if (!initialized) {
    initialized = YES;
    _attribute = [[SRACharacteristicType alloc] initWithName:@"attribute"];
    _skill = [[SRACharacteristicType alloc] initWithName:@"skill"];
  }

}


- (id)initWithName:(NSString *)aName {
  self = [super init];
  if (self) {
    _name = [aName copy];
  }

  return self;

}

+ (SRACharacteristicType *)attribute {
  return _attribute;

}

+ (SRACharacteristicType *)skill {
  return _skill;

}


@end