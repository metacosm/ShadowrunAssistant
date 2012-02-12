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

NSString const* DEFAULT_CHARACTER_NAME = @"Unnamed";
NSString const *ATTR_AGILITY = @"agility";
NSString const *ATTR_BODY = @"body";
NSString const *ATTR_REACTION = @"reaction";
NSString const *ATTR_STRENGTH = @"strength";
NSString const *ATTR_CHARISMA = @"charisma";
NSString const *ATTR_INTUITION = @"intuition";
NSString const *ATTR_LOGIC = @"logic";
NSString const *ATTR_WILLPOWER = @"willpower";
NSString const *ATTR_EDGE = @"edge";


@interface SRACharacter ()
- (SRACharacteristic *)characteristic:(NSString const *)name;

@end

@implementation SRACharacter {
@private
  NSMutableDictionary *characteristics;
}

@synthesize realName = _realName;
@synthesize name = _name;
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

- (id)init {
  return [self initWithName:DEFAULT_CHARACTER_NAME];
}

- (id)initWithName:(NSString const *)name {
  self = [super init];
  if (self) {
    _name = [NSString stringWithString:name];
    _realName = _name;
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


@end