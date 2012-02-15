//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristic.h"
#import "SRACharacteristicType.h"
#import "SRACharacteristicInfo.h"
#import "SRACharacteristicInfoRegistry.h"


@implementation SRACharacteristic {
}

@synthesize unmodifiedValue = _unmodifiedValue;
@synthesize info = _info;


+ (SRACharacteristic *)characteristic:(SRACharacteristicInfo *)characteristicInfo withValue:(int)value {
  return [[SRACharacteristic alloc] initWith:characteristicInfo withValue:value];

}

- (NSString *)name {
  return [_info name];

}


- (SRACharacteristicType *)type {
  return [_info type];

}

- (id)initWith:(SRACharacteristicInfo *)info withValue:(int)value {
  self = [super init];
  if (self) {
    _unmodifiedValue = value;
    _info = info;
  }
  return self;

}
@end