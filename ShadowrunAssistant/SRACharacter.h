@class SRACharacteristicInfo;
@class SRACharacteristic;

@interface SRACharacter : NSObject {
}

@property(readonly, copy) NSString *name;
@property(readonly, copy) NSString *nickname;
@property(readwrite) int currentKarma;
@property(readonly) int totalKarma;

- (id)initWithName:(NSString *)name andNickname:(NSString *)nickname;

- (SRACharacteristicInfo *)characteristicInfo:(NSString *)name;

- (void)addCharacteristic:(SRACharacteristic *)characteristic;

+ (SRACharacter *)characterNamed:(NSString *)name nicknamed:(NSString *)nick;

- (int)modifiedValueForCharacteristic:(NSString const *)string;
@end