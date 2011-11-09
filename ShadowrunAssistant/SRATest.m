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


@interface SRATest ()
- (id)initWithContext:(SRATestContext *)context withSkill:(SRASkillInfo *)skill;
@end

@interface SRATestWithDifferentAttribute : SRATest {
  SRAAttributeInfo *_attribute;
}

- (id)initWithContext:(SRATestContext *)context withSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute;

@end

@implementation SRATestWithDifferentAttribute
- (id)initWithContext:(SRATestContext *)context withSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute {
  self = [super initWithContext:context withSkill:skill];
  if (self) {
    _attribute = attribute;
  }

  return self;
}


@end


@implementation SRATest {
  SRACharacteristicInfo *_primary;
}

- (id)initWithContext:(SRATestContext *)context withSkill:(SRASkillInfo *)skill {
  self = [super init];
  if (self) {
    _primary = skill;
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


- (int)dicePoolForCharacter:(SRACharacter *)character {
  return 0;

}

+ (SRATest *)testingAttributeOnly:(SRAAttributeInfo *)attribute withContext:(SRATestContext *)context {
  return nil;
}

+ (SRATest *)testingSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute withContext:(SRATestContext *)context {
  SRATest *test;
  if (attribute && ![attribute isEqual:[skill linkedAttribute]]) {
    test = [[SRATestWithDifferentAttribute alloc] initWithContext:context withSkill:skill withAttribute:attribute];
  }
  else {
    test = [[self alloc] initWithContext:nil withSkill:skill];

  }
  return test;
}

@end
