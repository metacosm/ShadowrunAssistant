@class SRACharacteristicInfo;
@class SRACharacteristic;
@class SRACharacteristicType;
@class SRAEngine;

static NSString const *DEFAULT_CHARACTER_NAME = @"Unnamed";

@interface SRACharacter : NSObject {
}

@property(readonly, copy) NSString *realName;
@property(readonly, copy) NSString *name;
@property(readwrite) int currentKarma;
@property(readonly) int totalKarma;

@property(readonly, weak) SRAEngine *engine;

- (id)initWithName:(NSString const *)name engine:(SRAEngine *)engine;

- (SRACharacteristicInfo *)characteristicInfo:(NSString const *)name;

- (void)setCharacteristic:(NSString const *)name withValue:(int)value;

- (int)modifiedValueForCharacteristic:(NSString const *)string;
@end