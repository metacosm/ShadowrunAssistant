//
//  Created by claprun on 11/7/11.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SRATest.h"
#import "SRACharacter.h"
#import "SRACharacteristicInfo.h"
#import "SRASkillInfo.h"
#import "SRAAttributeInfo.h"
#import "SRATestContext.h"
#import "SRACharacteristic.h"
#import "SRACharacteristicType.h"
#import "SRAConstants.h"


@interface SRATest ()
- (id)initWithContext:(SRATestContext *)context withPrimaryCharacteristic:(SRACharacteristicInfo *)characteristic;
@end

@interface SRATestWithAttribute : SRATest {
  SRACharacteristicInfo *_attribute;
}

- (id)initWithContext:(SRATestContext *)context withPrimaryCharacteristic:(SRACharacteristicInfo *)primary withSecondaryCharacteristic:(SRACharacteristicInfo *)secondary;

@end

@implementation SRATestWithAttribute
- (id)initWithContext:(SRATestContext *)context withPrimaryCharacteristic:(SRACharacteristicInfo *)primary withSecondaryCharacteristic:(SRACharacteristicInfo *)secondary {
  self = [super initWithContext:context withPrimaryCharacteristic:primary];
  if (self) {
    _attribute = secondary;
  }

  return self;

}

- (SRACharacteristicInfo *)secondaryCharacteristic {
  return _attribute;

}

@end


@implementation SRATest {
  SRACharacteristicInfo *_primary;
  SRATestContext *_context;
}

- (id)initWithContext:(SRATestContext *)context withPrimaryCharacteristic:(SRACharacteristicInfo *)characteristic {
  self = [super init];
  if (self) {
    _context = context;
    _primary = characteristic;
  }

  return self;
}


- (SRACharacteristicInfo *)secondaryCharacteristic {
  if ([_primary isKindOfClass:[SRASkillInfo class]]) {
    return [(SRASkillInfo *) _primary linkedAttribute];
  }
  else {
    return nil;
  }
}

- (SRACharacteristicInfo *)primaryCharacteristic {
  return _primary;
}


- (int)modifiedCharacteristic:(SRACharacteristicInfo *)characteristicInfo forCharacter:(SRACharacter *)character {
  SRACharacteristic *characteristic = [character characteristic:[characteristicInfo name]];

  // check if we are defaulting
  if (!characteristic && [[SRACharacteristicType skill] isEqual:[characteristicInfo type]]) {
    SRASkillInfo *skillInfo = (SRASkillInfo *) characteristicInfo;
    return [[character characteristic:[[skillInfo linkedAttribute] name]] modifiedValue];
  }
  return [characteristic modifiedValue];
}

- (int)dicePoolFor:(SRACharacter *)character {
  // initial dice pool
  int dicePool = [self modifiedCharacteristic:[self primaryCharacteristic] forCharacter:character]
      + [self modifiedCharacteristic:[self secondaryCharacteristic] forCharacter:character]
      + [_context bonusFor:character]
      - [_context malusFor:character];

  // check if character is using edge
  if ([_context edgeFor:character]) {
    dicePool += [[character characteristic:ATTR_EDGE] modifiedValue];
  }

  return dicePool;

}

+ (SRATest *)testingAttributeOnlyWith:(SRAAttributeInfo *)firstAttribute secondAttribute:(SRAAttributeInfo *)secondAttribute withContext:(SRATestContext *)context {
  SRATest *test;

  if (!secondAttribute) {
    secondAttribute = firstAttribute;
  }

  test = [[SRATestWithAttribute alloc] initWithContext:context withPrimaryCharacteristic:firstAttribute withSecondaryCharacteristic:secondAttribute];

  return test;
}

+ (SRATest *)testingSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute withContext:(SRATestContext *)context {
  SRATest *test;

  // if we don't specify an attribute use the skill's linked attribute
  if (attribute && ![attribute isEqual:[skill linkedAttribute]]) {
    test = [[SRATestWithAttribute alloc] initWithContext:context withPrimaryCharacteristic:skill withSecondaryCharacteristic:attribute];
  }
  else {
    test = [[self alloc] initWithContext:nil withPrimaryCharacteristic:skill];

  }
  return test;
}

+ (SRATest *)testingSkill:(SRASkillInfo *)skill withContext:(SRATestContext *)context {
 return [self testingSkill:skill withAttribute:nil withContext:context];

}
@end
