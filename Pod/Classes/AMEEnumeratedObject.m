//
//  AMEEnumeratedObject.m
//  Pods
//
//  Created by Satoshi Namai on 2014/07/03.
//
//

#import "AMEEnumeratedObject.h"
#import <objc/runtime.h>

static NSMutableDictionary *globalEnumerateObjectStore;

@interface AMEEnumeratedObject ()
@property (nonatomic, strong) NSString *descriptionString;
@end

@implementation AMEEnumeratedObject

+ (instancetype)enumObject
{
    return [self defineEnum:NSNotFound name:nil description:nil];
}

+ (instancetype)defineEnum:(NSUInteger)ordinal
{
    return [self defineEnum:ordinal name:nil description:nil];
}

+ (instancetype)defineEnum:(NSUInteger)ordinal name:(NSString *)name
{
    return [self defineEnum:ordinal name:name description:nil];
}

+ (instancetype)defineEnum:(NSUInteger)ordinal name:(NSString *)name description:(NSString *)description
{
    NSString *key = NSStringFromClass(self);
    if (!globalEnumerateObjectStore[key] && ordinal == NSNotFound) {
        NSLog(@"undefined enumerate object error %@", self);
        return nil;
    }
    if (globalEnumerateObjectStore[key]) {
        return globalEnumerateObjectStore[key];
    }

    return globalEnumerateObjectStore[key] = [[self alloc] initWithOrdinal:ordinal name:name description:description];
}

- (instancetype)initWithOrdinal:(NSUInteger)ordinal name:(NSString *)name description:(NSString *)description
{
    self = [super init];
    if (self) {
        _ordinal = ordinal;
        _name = name ? name : NSStringFromClass(self.class);
        _descriptionString = description;
    }
    return self;
}

- (NSString *)description
{
    return _descriptionString ? _descriptionString : [super description];
}

@end

@implementation AMEEnumerateCollection

+ (void)initialize
{
    if (self == [self class]) {
        [self values];
    }
}

+ (NSArray *)values
{
    return nil;
}

+ (AMEEnumeratedObject *)valueForName:(NSString *)name
{
    NSArray *values = [self values];
    for (AMEEnumeratedObject *value in values) {
        if ([value.name isEqualToString:name]) {
            return value;
        }
    }
    return nil;
}

@end

@implementation AMEEnumeratedObjectInitializer

+ (void)initializeAllEnumerateObjects
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        globalEnumerateObjectStore = [NSMutableDictionary dictionary];
        int count = objc_getClassList(NULL, 0);
        Class classes[count];

        if (count <= 0) {
            return;
        }
        objc_getClassList(classes, count);
        for (int i = 0; i < count; i++) {
            Class clazz = classes[i];
            if (class_getSuperclass(clazz) == AMEEnumerateCollection.class) {
                [clazz initialize];
            }
        }
    });
}

@end
