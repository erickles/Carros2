//
//  DSMHttpAsyncHelper.m
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 21/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import "DSMHttpAsyncHelper.h"
#import "DSMHttpAsyncHelperDelegate.h"
@implementation DSMHttpAsyncHelper
@synthesize delegate;
-(void)doGet:(NSString *)url{
    // Cria o NSMutable para receber o retorno
    retornoHttp = [NSMutableData data];
    // Inicia a request HTTP, disparando de forma assincrona
    // O delegate:self indica que vamos receber os eventos nessa classe
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark - Http
// Recebeu uma resposta do servidor
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [retornoHttp setLength:0];
}

// Recebeu dados, então vamos adicionar no NSData
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [retornoHttp appendData:data];
}

// Ocorreu erro
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if(delegate){
        // Avisa o delegate do erro
        [delegate requestEndWithError:error];
    }
}

// Terminou a requisição
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if(delegate){
        // Avisa o delegate que a requisição terminou
        [delegate requestEndWithData:retornoHttp];
    }
}

@end
