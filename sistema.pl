:- dynamic resposta/2. %definindo a resposta como dinamica
%__________________________________________________________________________________________________________

%predicado que calcula a pontuação
calcula_pontuacao(Trilha, Pontuacao, Total) :-
    % Total considera todas as perguntas relacionadas às características da trilha
    findall(P,
        (
            perfil(Trilha, Caracteristica, P),
            pergunta(_, _, Caracteristica)
        ),
        ListaPesos),
    sum_list(ListaPesos, Total),

    % Pontuação soma apenas onde houve resposta 's'
    findall(P,
        (
            perfil(Trilha, Caracteristica, P),
            pergunta(ID, _, Caracteristica),
            resposta(ID, s)
        ),
        ListaRespostas),
    sum_list(ListaRespostas, Pontuacao).

%____________________________________________________________________________________________________

%resultado da trilha
resultado_trilha(Trilha, [Trilha, Pontuacao, Total, Percentual]) :-
    calcula_pontuacao(Trilha, Pontuacao, Total),
    (   Total =:= 0 %aqui somos obrigado a definir que o total é 0 o percentual também é zero
    ->  Percentual = 0.0 %pra nao ocorrer a divisão por zero no pass a baixo.
    ;   Percentual is (Pontuacao / Total) * 100 %calcula o percentual
    ).

%_______________________________________________________________________________________________________

%comparado pra dar o percentual
compare_percent(Order, [_T1,_P1,_Tot1,Percent1], [_T2,_P2,_Tot2,Percent2]) :-
    ( Percent1 > Percent2 -> Order = '<'   %primeiro antes do segundo
    ; Percent1 < Percent2 -> Order = '>'   %segundo antes do primeiro
    ; Order = '=' ).

%_______________________________________________________________________________________________________

%retorna a lista ordenada ness modelo -> [Trilha, Pontuacao, Total, Percentual]
recomenda(ResultadoOrdenado) :-
    findall(Trilha, trilha(Trilha, _), Trilhas),
    maplist(resultado_trilha, Trilhas, ListaResultados),
    predsort(compare_percent, ListaResultados, ResultadoOrdenado).

%_______________________________________________________________________________________________________

%exibe resultado pra carreira principal com o motivo.
% exibe_resultado/1: trata o primeiro (melhor) com mensagem especial e depois imprime os demais
exibe_resultado([]) :- !.
exibe_resultado([[Trilha, Pontuacao, Total, Percentual] | Resto]) :-
    % imprime o primeiro (com possivel mensagem especial)
    trilha(Trilha, Descricao),
    format('Trilha: ~w~n', [Trilha]),
    format('Descricao: ~w~n', [Descricao]),
    format('Pontuacao: ~w / ~w (~2f%)~n', [Pontuacao, Total, Percentual]),
    (   mensagem_trilha(Trilha, Msg)
    ->  format('~w~n~n', [Msg])
    ;   nl
    ),
    % imprime o resto sem checar mensagem_trilha
    exibe_resultado_resto(Resto).

%__________________________________________________________________________________________________________

%exibe o resultado do resto (sem ser o principal)
exibe_resultado_resto([]) :- !.
exibe_resultado_resto([[Trilha, Pontuacao, Total, Percentual] | Resto]) :-
    trilha(Trilha, Descricao),
    format('Trilha: ~w~n', [Trilha]),
    format('Descricao: ~w~n', [Descricao]),
    format('Pontuacao: ~w / ~w (~2f%)~n~n', [Pontuacao, Total, Percentual]),
    exibe_resultado_resto(Resto).

%___________________________________________________________________________________________________________

% Limpa as repostas antigas para caso ja tenha rodado o codigo antes
limpa_respostas :-
    retractall(resposta(_, _)).

%________________________________________________________________________________________________________

%predicado que faz as perguntas
faz_perguntas :-
    forall(pergunta(ID, Texto, _),
        (
            perguntar(Texto, Resp),
            assertz(resposta(ID, Resp))
        )).
%__________________________________________________________________________________________________________

% Predicado que mantem a consistencia da resposta (só aceita s ou n)
perguntar(Texto, Resp) :-
    repeat,
    format('~w (s/n): ', [Texto]),
    flush_output,  % garante que aparece na tela antes de ler
    read_line_to_string(user_input, Input),
    string_lower(Input, Lower),
    (   Lower = "s" -> Resp = s, !    % resposta válida
    ;   Lower = "n" -> Resp = n, !    % resposta válida
    ;   writeln("Resposta invalida, digite apenas s ou n."), fail
    ).

%__________________________________________________________________________________________________________
%prdicado principal como dito no documento.
iniciar :-
    limpa_respostas,
    faz_perguntas,
    recomenda(Resultado),
    exibe_resultado(Resultado).
