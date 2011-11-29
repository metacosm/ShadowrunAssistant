//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristic.h"
#import "SRACharacteristicType.h"
#import "SRACharacteristicInfo.h"


@implementation SRACharacteristic {
}

@synthesize unmodifiedValue = _unmodifiedValue;
@synthesize info = _info;


+ (SRACharacteristic *)characteristicNamed:(NSString *)name ofType:(SRACharacteristicType *)type withValue:(int)value {
  SRACharacteristicInfo *info = [SRACharacteristicInfo characteristicInfoNamed:name typed:type];
  if (info) {
    return [[SRACharacteristic alloc] initWith:info withValue:value];
  }
  return nil;

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