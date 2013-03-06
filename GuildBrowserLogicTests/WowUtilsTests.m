#import "WowUtilsTests.h"
#import "WowUtils.h"

@implementation WowUtilsTests

// 1
-(void)testCharacterClassNameLookup
{
    // 2
    STAssertEqualObjects(@"Warrior",
                         [WoWUtils classFromCharacterType:1],
                         @"ClassType should be Warrior");
    // 3
    STAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType:2]],
                  nil);
    
    // 4
    STAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]],
                 nil);
    // add the rest as an exercise
    STAssertEqualObjects(@"Hunter",
                         [WoWUtils classFromCharacterType:3],
                         @"ClassType should be Hunter");
    STAssertEqualObjects(@"Rogue",
                         [WoWUtils classFromCharacterType:4],
                         @"ClassType should be Rogue");
    STAssertEqualObjects(@"Priest",
                         [WoWUtils classFromCharacterType:5],
                         @"ClassType should be Priest");
    STAssertEqualObjects(@"Death Knight",
                         [WoWUtils classFromCharacterType:6],
                         @"ClassType should be Death Knight");
    STAssertEqualObjects(@"Shaman",
                         [WoWUtils classFromCharacterType:7],
                         @"ClassType should be Shaman");
    STAssertEqualObjects(@"Mage",
                         [WoWUtils classFromCharacterType:8],
                         @"ClassType should be Mage");
 
    
}

- (void)testRaceTypeLookup
{
    STAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1], nil);
    STAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2], nil);
    STAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]],nil);
    // add the rest as an exercise
}

- (void)testQualityLookup
{
    STAssertEquals(@"Grey", [WoWUtils qualityFromQualityType:1], nil);
    STAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]],nil);
    // add the rest as an exercise
}

@end