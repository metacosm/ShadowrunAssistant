@interface SRACharacter : NSObject {
}

@property(copy) NSString *name;
@property(copy) NSString *nickname;
@property int currentKarma;
@property(readonly) int totalKarma;

- (id)initWithName:(NSString *)name andNickname:(NSString *)nickname;

- (int)attribute:(NSString *)name;

- (int)unmodifiedSkill:(NSString *)name;

- (int)modifiedSkill:(NSString *)name;

- (void)addSkill:(NSString *)name withLevel:(int)level;

- (id)initWithName:(NSString *)name andNickname: (NSString *) nick;

+ (SRACharacter *)characterNamed:(NSString *)name nicknamed:(NSString *)nick;

@end