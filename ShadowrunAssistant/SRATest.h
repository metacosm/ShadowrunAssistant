@class SRACharacteristicInfo;
@class SRACharacter;
@class SRAAttributeInfo;
@class SRASkillInfo;
@class SRAContext;

@interface SRATest : NSObject {
}

@property(readonly) SRACharacteristicInfo *primaryCharacteristic;

@property(readonly) SRACharacteristicInfo *secondaryCharacteristic;

- (int)dicePoolFor:(SRACharacter *)character;

+ (SRATest *)testingSkill:(SRASkillInfo *)skill withAttribute:(SRAAttributeInfo *)attribute withContext:(SRAContext *)context;

+ (SRATest *)testingAttributeOnlyWith:(SRAAttributeInfo *)firstAttribute secondAttribute:(SRAAttributeInfo *)secondAttribute withContext:(SRAContext *)context;

+ (SRATest *)testingSkill:(SRASkillInfo *)skill withContext:(SRAContext *)context;
@end