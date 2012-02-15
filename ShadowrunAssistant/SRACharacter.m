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
#import "SRAEngine.h"
#import "SRACharacteristicInfoRegistry.h"

@interface SRACharacter ()
- (SRACharacteristic *)characteristic:(NSString const *)name;

@end

@implementation SRACharacter {
@private
  NSMutableDictionary *characteristics;
  SRAEngine *__weak _engine;
}

@synthesize realName = _realName;
@synthesize name = _name;
@synthesize currentKarma = _currentKarma;
@synthesize totalKarma = _totalKarma;
@synthesize engine = _engine;


- (SRACharacteristicInfo *)characteristicInfo:(NSString *)name {
  SRACharacteristic *characteristic = [self characteristic:name];
  return [characteristic info];
}

- (SRACharacteristic *)characteristic:(NSString const *)name {
  return [characteristics objectForKey:name];
}

- (void)setCharacteristic:(NSString const *)name withValue:(int)value {
  if (name) {
    SRACharacteristicInfo *const info = [[_engine characteristicRegistry] characteristicInfoNamed:name];
    SRACharacteristic *const characteristic = [SRACharacteristic characteristic:info withValue:value];
    [characteristics setObject:characteristic forKey:name];
  }
}

- (id)init {
  return [self initWithName:DEFAULT_CHARACTER_NAME engine:NULL];
}

- (id)initWithName:(NSString const *)name engine:(SRAEngine *)engine {
  self = [super init];
  if (self) {
    _name = [NSString stringWithString:name];
    _realName = _name;
    _engine = engine;
    NSArray *const supportedAttributes = engine.supportedAttributes;
    characteristics = [NSMutableDictionary dictionaryWithCapacity:supportedAttributes.count];
    for(NSString *attributeName in supportedAttributes) {
      [self setCharacteristic:attributeName withValue:0];
    }
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