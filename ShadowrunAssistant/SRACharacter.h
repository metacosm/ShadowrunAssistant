@class SRACharacteristicInfo;
@class SRACharacteristic;

extern NSString const* DEFAULT_CHARACTER_NAME;

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