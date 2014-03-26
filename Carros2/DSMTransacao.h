//
//  DSMTransacao.h
//  Carros2
//
//  Created by DSM Brasil Produtos Nutricionais SA on 28/01/14.
//  Copyright (c) 2014 DSM Brasil Produtos Nutricionais SA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DSMTransacao <NSObject>
// Este método vai executar em uma thread separada
-(void)transacaoExecutar;
// Este método vai executar na thread primcipal - UI Thread
-(void)transacaoAtualizarInterface;
@end
