#import "Combinator.h"

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    if ([array count]==2) {
        NSInteger m =[[array firstObject]integerValue];
        NSInteger n =[[array lastObject]integerValue];
        if (m == n) {
            return @1;
        }else{
            for (NSInteger i = 1; i < n; i++) {
                double numberCombin = [self calc:n]/([self calc:i]* [self calc:n-i]);
                if (numberCombin>=m) {
                    return [NSNumber numberWithInteger:i];
                }
        }
    }
}
    return nil;
}

- (NSInteger)calc:(NSInteger)number {
    NSInteger value = 1;
    
    for (NSInteger i = 1; i <= number; i++) {
        value *= i;
    }
    
    return value;
}

@end
