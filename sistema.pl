% Predicado que serve para calcular a pontuação
calcula_pontuacao(Trilha, Pontuacao, Total) :-
    findall(Peso, perfil(Trilha, _, Peso), ListaPesos),% todos os pesos da trilha
    sum_list(ListaPesos, Total), % soma total possível
    findall(P, (
        perfil(Trilha, Caracteristica, P),
        pergunta(ID, _, Caracteristica),
        resposta(ID, s)         % só conta se respondeu sim
    ), ListaRespostas),
    sum_list(ListaRespostas, Pontuacao).% soma apenas os pontos obtidos
