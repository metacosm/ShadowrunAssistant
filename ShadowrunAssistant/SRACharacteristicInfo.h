@class SRACharacteristicType;

@interface SRACharacteristicInfo : NSObject

- (NSString *)name;

- (NSString *)description;

- (SRACharacteristicType *)type;

- (NSSet *)qualities;

+ (SRACharacteristicInfo *)characteristicInfoNamed:(NSString *)name typed:(SRACharacteristicType *)type;

@end