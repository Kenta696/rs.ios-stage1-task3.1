#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    NSMutableString* storageString = [[NSMutableString alloc]init];
    if ([numbers count]!=0) {
        if ([[numbers firstObject]integerValue]!=0 && [[numbers firstObject]integerValue]!=1 && ([numbers count]-1)!=1) {
            NSString* str1 = [NSString stringWithFormat:@"%@x^%lu", [numbers firstObject],[numbers count]-1];
            [storageString appendString:str1];
        }else if ([[numbers firstObject]integerValue]==1 && [[numbers firstObject]integerValue]==-1 && ([numbers count]-1)!=1) {
            NSString* str2 = [NSString stringWithFormat:@"x^%lu",[numbers count]-1];
            [storageString appendString:str2];
        } else if ([[numbers firstObject]integerValue]!=0 && [[numbers firstObject]integerValue]!=1 && ([numbers count]-1)==1) {
            NSString* str3 = [NSString stringWithFormat:@"%@x", [numbers firstObject]];
            [storageString appendString:str3];
        }
        for (int i = 1;i<[numbers count]; i++) {
            if ([[numbers objectAtIndex:i]integerValue]>0 && [[numbers objectAtIndex:i]integerValue]!=1 && ([numbers count]-i)-1!=1  && ([numbers count]-i)-1!=0)  {
                NSString* str4 = [NSString stringWithFormat:@"+%@x^%lu", [numbers objectAtIndex:i],([numbers count]-i)-1];
                [storageString appendString:str4];
            }else if ([[numbers objectAtIndex:i]integerValue]<0 &&[[numbers objectAtIndex:i]integerValue]!=1 && ([numbers count]-i)-1!=1 && ([numbers count]-i)-1!=0){
                NSString* str5 = [NSString stringWithFormat:@"%@x^%lu", [numbers objectAtIndex:i],([numbers count]-1)-1];
                [storageString appendString:str5];
            }if ([[numbers objectAtIndex:i]integerValue]==1 && ([numbers count]-i)-1!=1 && ([numbers count]-i)-1!=0) {
                NSString* str6 = [NSString stringWithFormat:@"+x^%lu",([numbers count]-i)-1];
                [storageString appendString:str6];
            }else if ([[numbers objectAtIndex:i]integerValue]==-1 && ([numbers count]-i)-1!=1&& ([numbers count]-i)-1!=0){
                NSString* str7 = [NSString stringWithFormat:@"x^%lu",([numbers count]-i)-1];
                [storageString appendString:str7];
            } if ([[numbers objectAtIndex:i]integerValue]>0 && [[numbers objectAtIndex:i]integerValue]!=1 && ([numbers count]-i)-1==1) {
                NSString* str8 = [NSString stringWithFormat:@"+%@x", [numbers objectAtIndex:i]];
                [storageString appendString:str8];
            }else if ([[numbers objectAtIndex:i]integerValue]<0 && [[numbers objectAtIndex:i]integerValue]!=-1 && ([numbers count]-i)-1==1){
                NSString* str9 = [NSString stringWithFormat:@"%@x",[numbers objectAtIndex:i]];
                [storageString appendString:str9];
            }    if ([[numbers objectAtIndex:i]integerValue]>0 && [[numbers objectAtIndex:i]integerValue]!=1 && ([numbers count]-i)-1!=1 && ([numbers count]-i)-1==0) {
                NSString* str12 = [NSString stringWithFormat:@"+%@", [numbers objectAtIndex:i]];
                [storageString appendString:str12];
            } if ([[numbers objectAtIndex:i]integerValue]<0 && [[numbers objectAtIndex:i]integerValue]!=1 && ([numbers count]-i)-1!=1 && ([numbers count]-i)-1==0) {
                NSString* str13 = [NSString stringWithFormat:@"%@", [numbers objectAtIndex:i]];
                [storageString appendString:str13];
            }if ([[numbers objectAtIndex:i]integerValue]==1 && ([numbers count]-i)-1==1) {
                NSString* str10 = [NSString stringWithFormat:@"+x"];
                [storageString appendString:str10];
            }else if ([[numbers objectAtIndex:i]integerValue]==-1 && ([numbers count]-i)-1==1){
                NSString* str11 = [NSString stringWithFormat:@"-x"];
                [storageString appendString:str11];
            }if ([[numbers objectAtIndex:i]integerValue]==0) {
                
            }
        }
        NSString* results = [NSString stringWithString:storageString];
        return results;
    }else if ([numbers count]==0){
    } return nil;
}
@end
