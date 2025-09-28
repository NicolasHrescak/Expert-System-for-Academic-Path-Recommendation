
:- cd('c:/Users/vagner/Desktop/trabalho_prolog'). %Unica parte que se deve mudar ao rodar em outra maquina
:- consult('base_conhecimento.pl'). %consulta automaticamente a base de conhecimento
:- consult('sistema.pl'). %carrega todos os predicados pro funcionamento do sistema.

:- initialization(main). %inicializa o predicado main que roda todo o trabalho

main :-
    writeln("Digite 1, 2 ou 3 para usar um perfil de teste pronto."),
    writeln("Ou digite qualquer outra coisa para responder manualmente."),
    flush_output,
    read_line_to_string(user_input, Input),
    (   Input = "1" -> usar_perfil('perfil1.pl') %utiliza o input como forma de verificar o arquivo correto
    ;   Input = "2" -> usar_perfil('perfil2.pl')
    ;   Input = "3" -> usar_perfil('perfil3.pl')
    ;   iniciar
    ).

usar_perfil(Arquivo) :-
    limpa_respostas,
    consult(Arquivo),
    recomenda(Resultado),
    exibe_resultado(Resultado).
