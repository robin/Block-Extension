#import "NSArray+blocks.h"
#import <Foundation/Foundation.h>

void hello_world(void)
{
    void (^hello)(char*);
    
    hello = ^(char* str) {
        NSLog(@"hello %s", str);
    };
    
    hello("robin");    
}

void hello_all(void)
{
    NSArray * array = [NSArray arrayWithObjects:@"tom", @"jerry", @"robin", nil];
    [array each:^(id obj) {
        NSLog(@"hello %@", obj);
    }];
}

void hello_robin_only(void)
{
    NSArray * array = [NSArray arrayWithObjects:@"tom", @"jerry", @"robin", nil];
    [[array select:^(id obj) {
        return [obj isEqualToString:@"robin"];
    }] each:^(id obj) {
        NSLog(@"hello %@ only", obj);
    }];
}

void say(NSString *something)
{
    NSArray * array = [NSArray arrayWithObjects:@"tom", @"jerry", @"robin", nil];
    [array each:^(id obj) {
        NSLog(@"%@, %@", something, obj);
    }];    
}
int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    hello_world();
    hello_all();
    hello_robin_only();
    say(@"Goodbye");
    [pool drain];
    return 0;
}
