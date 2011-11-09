//
//  Created by claprun on 11/9/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristicInfo.h"
#import "SRACharacteristicType.h"


@implementation SRACharacteristicInfo {
  NSString *_name;
  NSString *_desc;
  SRACharacteristicType *_type;
}
- (NSString *)name {
  return _name;

}

- (NSString *)description {
  return _desc;

}

- (SRACharacteristicType *)type {
  return _type;

}

+ (SRACharacteristicInfo *)characteristicInfoNamed:(NSString *)name typed:(SRACharacteristicType *)type {
  SRACharacteristicInfo *info = [[self alloc] init];
  info->_name = [name copy];
  info->_type = type;
  return info;

}

- (NSSet *)qualities {
  return nil;

}

@end