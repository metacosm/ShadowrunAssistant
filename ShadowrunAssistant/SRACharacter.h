@class SRACharacteristicInfo;
@class SRACharacteristic;

extern NSString const* DEFAULT_CHARACTER_NAME;
extern NSString const *ATTR_AGILITY;
extern NSString const *ATTR_BODY;
extern NSString const *ATTR_REACTION;
extern NSString const *ATTR_STRENGTH;
extern NSString const *ATTR_CHARISMA;
extern NSString const *ATTR_INTUITION;
extern NSString const *ATTR_LOGIC;
extern NSString const *ATTR_WILLPOWER;
extern NSString const *ATTR_EDGE;


@interface SRACharacter : NSObject {
}

@property(readonly, copy) NSString *realName;
@property(readonly, copy) NSString *name;
@property(readwrite) int currentKarma;
@property(readonly) int totalKarma;

- (id)initWithName:(NSString const *)name;

- (SRACharacteristicInfo *)characteristicInfo:(NSString const *)name;

- (void)addCharacteristic:(SRACharacteristic *)characteristic;

- (int)modifiedValueForCharacteristic:(NSString const *)string;
@end