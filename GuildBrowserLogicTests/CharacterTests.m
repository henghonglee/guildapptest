#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTests
{
    // 1
    NSDictionary *_characterDetailJson;
}

// 2
-(void)setUp
{
    // 3
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class]
                             URLForResource:@"character" withExtension:@"json"];
    
    // 4
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    // 5
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    STAssertNotNil(json, @"invalid test data");
    
    
    _characterDetailJson = json;
}

-(void)tearDown
{
    // 6
    _characterDetailJson = nil;
}
- (void)testCreateCharacterFromDetailJson
{
    // 2
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    // 3
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil data");
}

// 1
-(void)testCreateCharacterFromDetailJsonProps
{
    Character *testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy, @"Could not create character from detail json");
    STAssertEqualObjects(testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    STAssertEqualObjects(testGuy.name, @"Hagrel", @"name is wrong");
    STAssertEqualObjects(testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    STAssertEqualObjects(testGuy.realm, @"Borean Tundra", @"realm is wrong");
    STAssertEqualObjects(testGuy.achievementPoints, @3130, @"achievement points is wrong");
    STAssertEqualObjects(testGuy.level,@85, @"level is wrong");
    
    STAssertEqualObjects(testGuy.classType, @"Warrior", @"class type is wrong");
    STAssertEqualObjects(testGuy.race, @"Human", @"race is wrong");
    STAssertEqualObjects(testGuy.gender, @"Male", @"gener is wrong");
    STAssertEqualObjects(testGuy.averageItemLevel, @379, @"avg item level is wrong");
    STAssertEqualObjects(testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}

// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    Character *testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy, @"Could not create character from detail json");
    STAssertEqualObjects(testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    STAssertEqualObjects(testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
    STAssertEqualObjects(testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    STAssertEqualObjects(testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    STAssertEqualObjects(testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    STAssertEqualObjects(testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    STAssertEqualObjects(testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    STAssertEqualObjects(testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    STAssertEqualObjects(testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    STAssertEqualObjects(testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    STAssertEqualObjects(testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    STAssertEqualObjects(testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    STAssertEqualObjects(testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    STAssertEqualObjects(testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    STAssertEqualObjects(testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    STAssertEqualObjects(testGuy.offHandItem.name,nil, @"offhand should be nil");
    STAssertEqualObjects(testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    STAssertEqualObjects(testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    STAssertEqualObjects(testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}
@end