@class SRACharacter;
@class SRATest;
@class SRATestResult;

@interface SRAEngine : NSObject {

}

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test;

- (SRATestResult *)testCharacter:(SRACharacter *)character forTest:(SRATest *)test withEdge:(BOOL)useEdge;

@end