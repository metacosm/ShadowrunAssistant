@class SRACharacteristicInfo;
@class SRACharacter;
@class SRAAttributeInfo;
@class SRASkillInfo;

@interface SRATest : NSObject {
}

- (SRACharacteristicInfo *)primaryCharacteristic;

- (SRACharacteristicInfo *)secondaryCharacteristic;

- (int)bonus;

- (int)malus;

- (int)threshold;

- (void)setThreshold:(int)threshold;

- (BOOL)edge;

- (void)useEdge:(BOOL)useEdge;

- (int)dicePoolForCharacter:(SRACharacter *)character;

+ (id)testingSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute withBonus:(int)bonus withMalus:(int)malus;

+ (SRATest *)testingAttributeOnly:(SRAAttributeInfo *)attribute withBonus:(int)bonus withMalus:(int)malus;

@end