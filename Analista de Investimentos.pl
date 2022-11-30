/*
* Analistas dos investimentos - Problema de Lógica
*   05 colunas
*   06 linhas
*   22 instruções
* Fonte:
* https://rachacuca.com.br/logica/problemas/analistas-de-ivestimentos/
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos
%% O que a gente tem de base de dados?

        %COLETES
        colete(amarelo).
        colete(azul).
        colete(branco).
        colete(verde).
        colete(vermelho).

        %NOMES
        nome(bruce).
        nome(felipe).
        nome(ricardo).
        nome(thiago).
        nome(vicente).

        %SEGMENTOS
        segmento(bancos).
        segmento(educacao).
        segmento(energeletrica).
        segmento(medicamentos).
        segmento(papelecelulose).


        %RETORNOS
        retorno(p20).
        retorno(p30).
        retorno(p40).
        retorno(p50).
        retorno(p60).

        %CORRETORAS
        corretora(cerebrol).
        corretora(brain).
        corretora(cucapac).
        corretora(cuca).
        corretora(rcinvestimentos).

        %IDADES
        idade(i30).
        idade(i35).
        idade(i40).
        idade(i45).
        idade(i50).


% Vamos estabelecemos uma regra com a função ALLDIFERENT
% podemos ter apenas um único resultado
    alldifferent([]).
    alldifferent([H|T]):- not(member(H,T)),
	                      alldifferent(T).


% Qual o modelo que a gente quer chegar?
modelo([
        (Colete_1, Nome_1, Segmento_1, Retorno_1, Corretora_1, Idade_1),
        (Colete_2, Nome_2, Segmento_2, Retorno_2, Corretora_2, Idade_2),
        (Colete_3, Nome_3, Segmento_3, Retorno_3, Corretora_3, Idade_3),
        (Colete_4, Nome_4, Segmento_4, Retorno_4, Corretora_4, Idade_4),
        (Colete_5, Nome_5, Segmento_5, Retorno_5, Corretora_5, Idade_5)
       ]) :-


% Vamos analisar cada uma das instruções do problema,
% sem seguir uma ordem pré-definida

%%%%%%%%%%%%%%%%%%%%%%%% Idade
idade(Idade_1),
idade(Idade_2),
idade(Idade_3),
idade(Idade_4),
idade(Idade_5),

%1) A idade do corretor da segunda coluna é 30.
(Idade_2==i30),

alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Corretora
corretora(Corretora_1),
corretora(Corretora_2),
corretora(Corretora_3),
corretora(Corretora_4),
corretora(Corretora_5),

%14) Cerebrol é 1 ou 5.
(Corretora_1==cerebrol; Corretora_5==cerebrol),

%11) Rcinvestimentos é 1 ou 5.
(Corretora_1==rcinvestimentos; Corretora_5==rcinvestimentos),

alldifferent([Corretora_1, Corretora_2, Corretora_3, Corretora_4, Corretora_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Nome
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),


%15) Quem tem 50 anos de idade é o Ricardo.
(
(Idade_1==i50, Nome_1==ricardo);
(Idade_2==i50, Nome_2==ricardo);
(Idade_3==i50, Nome_3==ricardo);
(Idade_4==i50, Nome_4==ricardo);
(Idade_5==i50, Nome_5==ricardo)
),

% Thiago esta exatamente a esquerda do analista de 35.
(
(Idade_2==i35, Nome_1==thiago);
(Idade_3==i35, Nome_2==thiago);
(Idade_4==i35, Nome_3==thiago);
(Idade_5==i35, Nome_4==thiago)
),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Retorno
retorno(Retorno_1),
retorno(Retorno_2),
retorno(Retorno_3),
retorno(Retorno_4),
retorno(Retorno_5),

(Retorno_2==p40),

alldifferent([Retorno_1, Retorno_2, Retorno_3, Retorno_4, Retorno_5]),

colete(Colete_1),
colete(Colete_2),
colete(Colete_3),
colete(Colete_4),
colete(Colete_5),

% Quem usa colete branco tem o retorno de 30.
(
(Colete_1==branco, Retorno_1==p30);
(Colete_2==branco, Retorno_2==p30);
(Colete_3==branco, Retorno_3==p30);
(Colete_4==branco, Retorno_4==p30);
(Colete_5==branco, Retorno_5==p30)
),

%Felipe esta exatamente a direita do analista de colete verde.
(
(Colete_1==verde, Nome_2==felipe);
(Colete_2==verde, Nome_3==felipe);
(Colete_3==verde, Nome_4==felipe);
(Colete_4==verde, Nome_5==felipe)
),

alldifferent([Colete_1, Colete_2, Colete_3, Colete_4, Colete_5]),

%Segmento
segmento(Segmento_1),
segmento(Segmento_2),
segmento(Segmento_3),
segmento(Segmento_4),
segmento(Segmento_5),

(
(Corretora_1==rcinvestimentos, Segmento_1==medicamentos);
(Corretora_2==rcinvestimentos, Segmento_2==medicamentos);
(Corretora_3==rcinvestimentos, Segmento_3==medicamentos);
(Corretora_4==rcinvestimentos, Segmento_4==medicamentos);
(Corretora_5==rcinvestimentos, Segmento_5==medicamentos)
),

(
(Colete_2==amarelo, Segmento_1==bancos);
(Colete_3==amarelo, Segmento_2==bancos);
(Colete_4==amarelo, Segmento_3==bancos);
(Colete_5==amarelo, Segmento_4==bancos)
),

alldifferent([Segmento_1, Segmento_2, Segmento_3, Segmento_4, Segmento_5]),

(
(Retorno_5==p20, (Colete_4==amarelo; Colete_3==amarelo; Colete_2==amarelo ; Colete_1==amarelo));
(Retorno_4==p20, (Colete_3==amarelo; Colete_2==amarelo; Colete_1==amarelo));
(Retorno_3==p20, (Colete_2==amarelo; Colete_1==amarelo));
(Retorno_2==p20, Colete_1==amarelo)
),

(
(Colete_1==azul, Corretora_2==cuca);
(Colete_2==azul, (Corretora_1==cuca; Corretora_3==cuca));
(Colete_3==azul, (Corretora_2==cuca; Corretora_4==cuca));
(Colete_4==azul, (Corretora_3==cuca; Corretora_5==cuca));
(Colete_5==azul, Corretora_4==cuca)
),

(
(Corretora_5==cucapac, (Colete_4==azul; Colete_3==azul; Colete_2==azul; Colete_1==azul));
(Corretora_4==cucapac, (Colete_3==azul; Colete_2==azul; Colete_1==azul));
(Corretora_3==cucapac, (Colete_2==azul; Colete_1==azul));
(Corretora_2==cucapac, Colete_1==azul)
),

(
(Colete_1==verde, Corretora_2==cucapac);
(Colete_2==verde, (Corretora_1==cucapac; Corretora_3==cucapac));
(Colete_3==verde, (Corretora_2==cucapac; Corretora_4==cucapac));
(Colete_4==verde, (Corretora_3==cucapac; Corretora_5==cucapac));
(Colete_5==verde, Corretora_4==cucapac)
),

(
(Idade_1==i45, Colete_2==verde);
(Idade_2==i45, (Colete_1==verde; Colete_3==verde));
(Idade_3==i45, (Colete_2==verde; Colete_4==verde));
(Idade_4==i45, (Colete_3==verde; Colete_5==verde));
(Idade_5==i45, Colete_4==verde)
),

(
(Retorno_5==p50, (Colete_4==verde; Colete_3==verde; Colete_2==verde; Colete_1==verde));
(Retorno_4==p50, (Colete_3==verde; Colete_2==verde; Colete_1==verde));
(Retorno_3==p50, (Colete_2==verde; Colete_1==verde));
(Retorno_2==p50, Colete_1==verde)
),

(
(Nome_1==bruce,(Colete_2==azul; Colete_3==azul; Colete_4==azul),Idade_5==i35);
(Nome_1==bruce,(Colete_2==azul; Colete_3==azul),Idade_4==i35);
(Nome_1==bruce,(Colete_2==azul),Idade_3==i35);
(Nome_2==bruce,(Colete_3==azul; Colete_4==azul),Idade_5==i35);
(Nome_2==bruce,(Colete_3==azul),Idade_4=i35);
(Nome_3==bruce,(Colete_4==azul),Idade_5==i35)
),

(
(Segmento_1==energeletrica,(Segmento_2==papelecelulose; Segmento_3==papelecelulose; Segmento_4==papelecelulose),Segmento_5==bancos);
(Segmento_1==energeletrica,(Segmento_2==papelecelulose; Segmento_3==papelecelulose),Segmento_4==bancos);
(Segmento_1==energeletrica,(Segmento_2==papelecelulose),Segmento_3==bancos);
(Segmento_2==energeletrica,(Segmento_3==papelecelulose; Segmento_4==papelecelulose),Segmento_5==bancos);
(Segmento_2==energeletrica,(Segmento_3==papelecelulose),Segmento_4==bancos);
(Segmento_3==energeletrica,(Segmento_4==papelecelulose),Segmento_5==bancos)
),

(
(Colete_1==verde, (Idade_2==i50; Idade_3==i50; Idade_4==i50; Idade_5==i50));
(Colete_2==verde, (Idade_3==i50; Idade_4==i50; Idade_5==i50));
(Colete_3==verde, (Idade_4==i50; Idade_5==i50));
(Colete_4==verde, Idade_5==i50)
  ),

(
(Colete_1==azul, (Retorno_2==p60; Retorno_3==p60; Retorno_4==p60; Retorno_5==p60));
(Colete_2==azul, (Retorno_3==p60; Retorno_4==p60; Retorno_5==p60));
(Colete_3==azul, (Retorno_4==p60; Retorno_5==p60));
(Colete_4==azul, Retorno_5==p60)
  ),

 (
(Colete_1==verde, (Segmento_2==educacao; Segmento_3==educacao; Segmento_4==educacao; Segmento_5==educacao));
(Colete_2==verde, (Segmento_3==educacao; Segmento_4==educacao; Segmento_5==educacao));
(Colete_3==verde, (Segmento_4==educacao; Segmento_5==educacao));
(Colete_4==verde, Segmento_5==educacao)
  ),


nl,
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
   %% statistics mostra informações sobre o uso de recursos
   %% Obtém o tempo inicial baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime,T1),

    %%chama modelo
    modelo(  [A1, A2, A3, A4,A5]  ),

    %%chama imprime_lista
    imprime_lista(  [A1, A2, A3, A4,A5]  ),

    %% Obtém o tempo final baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime ,T2),
    Tempo_BUSCA is T2 - T1,

    %%define o formato do tempo na saída
    format('\n T1: ~f \t T2: ~f  msec', [T1, T2]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.

main :-
    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').











