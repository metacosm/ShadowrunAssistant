//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristic.h"
#import "SRAPropertyType.h"
#import "SRACharacteristicInfo.h"


@implementation SRACharacteristic {
  SRACharacteristicInfo *_info;
}

- (int)unmodifiedValue {
  return 0;

}

- (int)modifiedValue {
  return 0;
  //To change the template use AppCode | Preferences | File Templates.

}

+ (SRACharacteristic *)characteristicNamed:(NSString *)name ofType:(SRAPropertyType *)type withValue:(int)value {
  return nil;
  //To change the template use AppCode | Preferences | File Templates.

}

- (SRACharacteristicInfo *)info {
  return _info;
}

- (NSString *)name {
  return [_info name];
}

@end