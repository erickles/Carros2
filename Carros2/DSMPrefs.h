//
//  DSMPrefs.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 27/12/13.
//  Copyright (c) 2013 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSMPrefs : NSObject
+(void) setString:(NSString *)valor chave:(NSString *)chave;
+(NSString *) getString:(NSString *)chave;
+(void) setInteger:(NSInteger)valor chave:(NSString *)chave;
+(NSInteger) getInteger:(NSString *) chave;
@end
