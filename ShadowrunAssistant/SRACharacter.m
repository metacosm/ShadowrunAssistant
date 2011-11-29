//
//  Created by claprun on 11/6/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRACharacter.h"
#import "SRACharacteristic.h"
#import "SRACharacteristicInfo.h"
#import "SRACharacteristicType.h"
#import "SRASkillInfo.h"

@interface SRACharacter ()
- (SRACharacteristic *)characteristic:(NSString const *)name;

@end

@implementation SRACharacter {
@private
  NSMutableDictionary *characteristics;
}

@synthesize name = _name;
@synthesize nickname = _nickname;
@synthesize currentKarma = _currentKarma;
@synthesize totalKarma = _totalKarma;

- (SRACharacteristicInfo *)characteristicInfo:(NSString *)name {
  SRACharacteristic *characteristic = [self characteristic:name];
  if (characteristic) {
    return [characteristic info];
  }
  else {
    return nil;
  }
}

- (SRACharacteristic *)characteristic:(NSString const *)name {
  return [characteristics objectForKey:name];
}

- (void)addCharacteristic:(SRACharacteristic *)characteristic {
  if (characteristic) {
    [characteristics setObject:characteristic forKey:[characteristic name]];
  }
}

- (id)initWithName:(NSString *)name andNickname:(NSString *)nickname {
  self = [super init];
  if (self) {
    _name = name;
    _nickname = nickname;
  }

  return self;
}

- (int)modifiedValueForCharacteristic:(NSString const *)name {
  SRACharacteristic *characteristic = [self characteristic:name];

  // check if we are defaulting
  if (!characteristic && [[SRACharacteristicType skill] isEqual:[characteristic type]]) {
    SRASkillInfo *skillInfo = (SRASkillInfo *) [characteristic info];
    return [[self characteristic:[[skillInfo linkedAttribute] name]] unmodifiedValue] /* + modifiers */;
  }
  return [characteristic unmodifiedValue] /* + modifiers */;

}

+ (SRACharacter *)characterNamed:(NSString *)name nicknamed:(NSString *)nick {

  return [[self alloc] initWithName:name andNickname:nick];

}

@end