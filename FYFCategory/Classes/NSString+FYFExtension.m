//
//  NSString+FYFExtension.m
//  KSCategory
//
//  Created by 范云飞 on 2021/8/19.
//

#import "NSString+FYFExtension.h"

@implementation NSString (FYFExtension)

//判断字符串是否为空
- (BOOL)fyf_isEmpty {
    NSString *result;
    if (self == nil || self == NULL || [self isKindOfClass:[NSNull class]] || [[self.description lowercaseString] isEqualToString:@"<null>"] || [[self.description lowercaseString] isEqualToString:@"null"] || [[self.description lowercaseString] isEqualToString:@"undefined"]) {
        result = @"";
    } else {
        NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet]; //空格或者回车符号
        result = [self.description stringByTrimmingCharactersInSet:charSet];
        result = [result stringByReplacingOccurrencesOfString:@"\0" withString:@""];
    }
    return (result.length == 0);
}

/// json 转dictionary
- (NSDictionary *)fyf_jsonToDictionary {
    NSObject *obj = [self fyf_jsonToObject];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    }
    return [NSDictionary dictionary];
}

/// json转object
- (NSObject *)fyf_jsonToObject {
    if (self.length) {
        NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
        NSError *parseError = nil;
        NSObject *obj = (NSObject *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseError];
        if (parseError) {
            return nil;
        }
        return obj;
    }
    return nil;
}

@end
