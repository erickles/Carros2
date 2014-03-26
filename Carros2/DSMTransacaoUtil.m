//
//  DSMTransacaoUtil.m
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 28/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import "DSMTransacaoUtil.h"

@implementation DSMTransacaoUtil
@synthesize transacao = _transacao;

-(void)iniciarTransacao:(NSObject<DSMTransacao> *)transacao{
    
    self.transacao = transacao;
    if(!queue){
        queue = [[NSOperationQueue alloc] init];
    }
    [queue cancelAllOperations];
    
    // Dispara o download em uma NSOperation
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(executeOnBackground) object:nil];
    [queue addOperation:operation];

}

#pragma mark - transacao
// Executa em uma thread
-(void)executeOnBackground{
    [self.transacao transacaoExecutar];
    [self performSelectorOnMainThread:@selector(executeOnUiThread) withObject:nil waitUntilDone:YES];
}
// Executa na thread principal
-(void)executeOnUiThread{
    [self.transacao transacaoAtualizarInterface];
}

@end
