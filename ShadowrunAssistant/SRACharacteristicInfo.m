//
//  Created by claprun on 11/9/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacteristicInfo.h"
#import "SRACharacteristicType.h"
#import "SRAAttributeInfo.h"
#import "SRASkillInfo.h"


@implementation SRACharacteristicInfo {
}

@synthesize name = _name;
@synthesize description = _desc;
@synthesize type = _type;

+ (SRACharacteristicInfo *)characteristicInfoNamed:(NSString const*)name typed:(SRACharacteristicType *)type {
  SRACharacteristicInfo *info;
  if([SRACharacteristicType attribute] == type)
  {
    info = [[SRAAttributeInfo alloc] init];
  }
  else
  {
    info = [[SRASkillInfo alloc] init];
  }
  info = [[self alloc] init];
  info->_name = [name copy];
  info->_type = type;
  return info;

}

- (NSSet *)qualities {
  return nil;

}

@end