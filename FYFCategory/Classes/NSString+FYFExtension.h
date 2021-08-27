//
//  NSString+FYFExtension.h
//  KSCategory
//
//  Created by 范云飞 on 2021/8/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FYFExtension)


//范云飞
//判断字符串是否为空
- (BOOL)fyf_isEmpty;

/// 范云飞
/// json 转换成字典
- (NSDictionary *)fyf_jsonToDictionary;

/// 范云飞
/// json 转成NSObject
- (NSObject *)fyf_jsonToObject;

/// 范云飞

@end

NS_ASSUME_NONNULL_END
