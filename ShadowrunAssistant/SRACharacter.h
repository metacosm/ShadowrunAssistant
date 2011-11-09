@class SRACharacteristicInfo;
@class SRACharacteristic;

@interface SRACharacter : NSObject {
}

- (NSString *)name;

- (NSString *)nickname;

- (int)currentKarma;

- (int)totalKarma;

- (id)initWithName:(NSString *)name andNickname:(NSString *)nickname;

- (SRACharacteristicInfo *)characteristicInfo:(NSString *)name;

- (SRACharacteristic *)characteristic:(NSString *)name;

- (void)addCharacteristic:(SRACharacteristic *)characteristic;

+ (SRACharacter *)characterNamed:(NSString *)name nicknamed:(NSString *)nick;

@end