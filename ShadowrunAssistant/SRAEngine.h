@class SRACharacter;
@class SRATest;
@class SRATestResult;
@class SRAContext;

extern NSString const *DEFAULT_ENGINE_NAME;
extern NSString const *SR4;

@interface SRAEngine : NSObject {

}

@property(readonly, strong) SRAContext *context;
@property(readonly, copy) NSString *name;

- (int) throwDie;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test withEdge:(BOOL)useEdge;

+ (SRAEngine *) engineNamed: (NSString *)engineName;

+ (SRAEngine *)defaultEngine;
@end