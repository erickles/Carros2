//
//  DSMHttpHelper.m
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 28/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import "DSMHttpHelper.h"

@implementation DSMHttpHelper

-(NSData*) doGet:(NSString *)url{
    //Cria a request, sem cache e com timeout de 30seg
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:30];
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = nil;
    // Faz a requisição de forma sincrona, que ja retorna o NSData
    // Este método vai ficar travado até o servidor retornar
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    return data;
}
@end
