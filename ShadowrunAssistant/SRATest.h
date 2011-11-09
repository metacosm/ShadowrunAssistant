@class SRACharacteristicInfo;
@class SRACharacter;
@class SRAAttributeInfo;
@class SRASkillInfo;
@class SRATestContext;

@interface SRATest : NSObject {
}

- (SRACharacteristicInfo *)primaryCharacteristic;

- (SRACharacteristicInfo *)secondaryCharacteristic;

- (int)dicePoolForCharacter:(SRACharacter *)character;

+ (SRATest *)testingSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute withContext:(SRATestContext *)context;

+ (SRATest *)testingAttributeOnlyWith:(SRAAttributeInfo *)firstAttribute secondAttribute:(SRAAttributeInfo *)secondAttribute withContext:(SRATestContext *)context;

@end