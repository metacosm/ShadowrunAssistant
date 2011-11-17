@class SRACharacteristicType;

@interface SRACharacteristicInfo : NSObject

@property(readonly, copy) NSString *name;
@property(readonly, copy) NSString *description;
@property(readonly, weak) SRACharacteristicType *type;

- (NSSet *)qualities;

+ (SRACharacteristicInfo *)characteristicInfoNamed:(NSString *)name typed:(SRACharacteristicType *)type;

@end