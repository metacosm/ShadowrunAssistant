@class SRACharacter;
@class SRATest;
@class SRATestResult;
@class SRAContext;
@class SRACharacterRegistry;
@class SRACharacteristicInfoRegistry;

static NSString *const SR4 = @"SR4";
static NSString *const DEFAULT_ENGINE_NAME = @"SR4";

static NSString const *ATTR_AGILITY = @"agility";
static NSString const *ATTR_BODY = @"body";
static NSString const *ATTR_REACTION = @"reaction";
static NSString const *ATTR_STRENGTH = @"strength";
static NSString const *ATTR_CHARISMA = @"charisma";
static NSString const *ATTR_INTUITION = @"intuition";
static NSString const *ATTR_LOGIC = @"logic";
static NSString const *ATTR_WILLPOWER = @"willpower";
static NSString const *ATTR_EDGE = @"edge";


@interface SRAEngine : NSObject {

}

@property(readonly, strong) SRAContext *context;
@property(readonly, copy) NSString *name;
@property(readonly, strong) SRACharacterRegistry *characterRegistry;
@property(readonly, strong) SRACharacteristicInfoRegistry *characteristicRegistry;
@property(readonly, strong) NSArray *supportedAttributes;

- (int) throwDie;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test withEdge:(BOOL)useEdge;

+ (SRAEngine *) engineNamed: (NSString const *)engineName;

+ (SRAEngine *)defaultEngine;
@end