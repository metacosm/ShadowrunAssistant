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

+ (SRATest *)testingAttributeOnly:(SRAAttributeInfo *)attribute withContext:(SRATestContext *)context;

@end