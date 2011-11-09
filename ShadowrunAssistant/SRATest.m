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


@interface SRATest ()
- (id)initWithSkill:(SRASkillInfo *)skill targetingThreshold:(int)threshold usingEdge:(BOOL)edge;
@end

@interface SRATestWithDifferentAttribute : SRATest {
  SRAAttributeInfo *_attribute;
}

- (id)initWithSkill:(SRASkillInfo *)skill targetingThreshold:(int)threshold usingEdge:(BOOL)edge withAttribute:(SRAAttributeInfo *)attribute;

@end

@implementation SRATestWithDifferentAttribute
- (id)initWithSkill:(SRASkillInfo *)skill targetingThreshold:(int)threshold usingEdge:(BOOL)edge withAttribute:(SRAAttributeInfo *)attribute {
  self = [super initWithSkill:skill targetingThreshold:threshold usingEdge:edge];
  if (self) {
    _attribute = attribute;
  }

  return self;
}


@end


@implementation SRATest {
  SRACharacteristicInfo *_primary;
  int _threshold;
  BOOL _edge;
}

- (id)initWithSkill:(SRASkillInfo *)skill targetingThreshold:(int)threshold usingEdge:(BOOL)edge {
  self = [super init];
  if (self) {
    _primary = skill;
    _threshold = threshold;
    _edge = edge;
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

- (int)bonus {
  return 0;
}

- (int)malus {
  return 0;
}

- (int)threshold {
  return _threshold;
}

- (void)setThreshold:(int)threshold {
  _threshold = threshold;
}

- (BOOL)edge {
  return _edge;
}

- (void)useEdge:(BOOL)useEdge {
  _edge = useEdge;
}


- (int)dicePoolForCharacter:(SRACharacter *)character {
  return 0;

}

+ (SRATest *)testingAttributeOnly:(SRAAttributeInfo *)attribute withBonus:(int)bonus withMalus:(int)malus {
  return nil;
}

+ (id)testingSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute withBonus:(int)bonus withMalus:(int)malus {
  SRATest *test;
  if (attribute && ![attribute isEqual:[skill linkedAttribute]]) {
    test = [[SRATestWithDifferentAttribute alloc] initWithSkill:skill targetingThreshold:1 usingEdge:NO withAttribute:attribute];
  }
  else {
    test = [[self alloc] initWithSkill:skill targetingThreshold:1 usingEdge:NO];

  }
  return test;
}

@end
