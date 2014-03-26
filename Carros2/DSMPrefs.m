//
//  DSMPrefs.m
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 27/12/13.
//  Copyright (c) 2013 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import "DSMPrefs.h"

@implementation DSMPrefs
+(void) setString:(NSString *)valor chave:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setValue:valor forKey:chave];
    [prefs synchronize];
}
+(NSString *) getString:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *valor = [prefs stringForKey:chave];
    return valor;
}
+(void) setInteger:(NSInteger)valor chave:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:valor forKey:chave];
    [prefs synchronize];
}
+(NSInteger) getInteger:(NSString *)chave{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger i = [prefs integerForKey:chave];
    return i;
}
@end
