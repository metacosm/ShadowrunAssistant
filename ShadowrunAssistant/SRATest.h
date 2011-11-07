@class SRAPropertyDescription;

@interface SRATest : NSObject {
}

@property(readonly) SRAPropertyDescription *attribute;
@property(readonly) SRAPropertyDescription *skill;
@property(readonly) int bonus;
@property(readonly) int malus;

+ (id)testingSkill:(SRAPropertyDescription *)skill withAttribute:(SRAPropertyDescription *)attribute withBonus:(int)bonus withMalus:(int)malus;
@end