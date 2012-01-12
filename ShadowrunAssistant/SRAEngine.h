@class SRACharacter;
@class SRATest;
@class SRATestResult;
@class SRATestContext;

@interface SRAEngine : NSObject {

}

- (int) throwDie;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test withEdge:(BOOL)useEdge;

+ (SRAEngine *) engineNamed: (NSString *)engineName;

@end