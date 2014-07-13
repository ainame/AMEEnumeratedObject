//
//  AMEEnumeratedObjectTests.m
//  AMEEnumeratedObjectTests
//
//  Created by ainame on 07/04/2014.
//  Copyright (c) 2014 ainame. All rights reserved.
//

#import <AMEEnumeratedObject.h>
#import "TestAlphabets.h"
#import "TestNumbers.h"

SpecBegin(InitialSpecs);
beforeAll(^{ [AMEEnumeratedObjectInitializer initializeAllEnumerateObjects]; });

describe(@"define values", ^{

    it(@"equal", ^{ expect([TestAlphabetOfA enumObject].ordinal).to.equal(0); });

    it(@"equal", ^{
        NSLog(@"%@", [TestAlphabetOfA enumObject]);
        expect([TestAlphabetOfA enumObject].name).to.equal(@"A");
    });

    it(@"equal", ^{ expect([[TestAlphabetOfA enumObject] description]).to.equal(@"えー"); });
});

describe(@"equality", ^{
    it(@"equal", ^{ expect([TestAlphabetOfA enumObject]).to.equal([TestAlphabetOfA enumObject]); });

    it(@"true", ^{ expect([TestAlphabetOfA enumObject] == [TestAlphabetOfA enumObject]).to.beTruthy; });

    it(@"is member", ^{ expect([[TestAlphabetOfA enumObject] isMemberOfClass:TestAlphabetOfA.class]).to.beTruthy; });

    it(@"is kind of class", ^{ expect(TestAlphabetOfA.class).to.beSubclassOf([TestAlphabet class]); });

    it(@"not equal", ^{ expect([TestAlphabetOfA enumObject]).notTo.equal([TestAlphabetOfB enumObject]); });

    it(@"false", ^{ expect([TestAlphabetOfA enumObject] == [TestAlphabetOfB enumObject]).to.beFalsy; });
});

describe(@"other enumerate objects", ^{
    it(@"equal", ^{ expect([TestNumberOf1 enumObject].ordinal).to.equal(0); });

    it(@"equal", ^{ expect([TestNumberOf1 enumObject].name).to.equal(@"one"); });

    it(@"equal", ^{ expect([[TestNumberOf1 enumObject] description]).to.equal(@"いち"); });
});

SpecEnd
