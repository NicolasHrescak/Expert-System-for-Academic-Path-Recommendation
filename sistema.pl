:- dynamic resposta/2. %definindo a resposta como dinamica

%calcula_pontuacao(Trilha, Pontuacao, Total)
calcula_pontuacao(Trilha, Pontuacao, Total) :-
    findall(Peso, perfil(Trilha, _, Peso), ListaPesos), %pego todos os pesos dessa trilha
    (   ListaPesos = []
    ->  %caso a trilha não tenha um perfil definido ou nao tenha no arquivo
        Total = 0, %Se ela não existe entao o total e a pontuacao é zero
        Pontuacao = 0
    ;   %soma total possível
        sum_list(ListaPesos, Total),
        %pega só os pesos em que a resposta foi "sim" e o "nao" é ignorado
        findall(P, (
            perfil(Trilha, Caracteristica, P),
            pergunta(ID, _, Caracteristica),
            resposta(ID, s)
        ), ListaRespostas),
        sum_list(ListaRespostas, Pontuacao)
    ).

% -------------resultado da trilha--------------------------

resultado_trilha(Trilha, [Trilha, Pontuacao, Total, Percentual]) :-
    calcula_pontuacao(Trilha, Pontuacao, Total),
    (   Total =:= 0 %aqui somos obrigado a definir que o total é 0 o percentual também é zero
    ->  Percentual = 0.0 %pra nao ocorrer a divisão por zero no pass a baixo.
    ;   Percentual is (Pontuacao / Total) * 100 %calcula o percentual
    ).

%---------comparado pra dar o percentual decrescente--------------------

compare_percent(Order, [_T1,_P1,_Tot1,Percent1], [_T2,_P2,_Tot2,Percent2]) :-
    ( Percent1 > Percent2 -> Order = '<'   %primeiro antes do segundo
    ; Percent1 < Percent2 -> Order = '>'   %segundo antes do primeiro
    ; Order = '=' ).

%retorna a lista ordenada no modelo -> [Trilha, Pontuacao, Total, Percentual]
recomenda(ResultadoOrdenado) :-
    findall(Trilha, trilha(Trilha, _), Trilhas),
    maplist(resultado_trilha, Trilhas, ListaResultados),
    predsort(compare_percent, ListaResultados, ResultadoOrdenado).
