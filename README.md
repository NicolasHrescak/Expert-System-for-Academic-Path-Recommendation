# Expert-System-for-Academic-Path-Recommendation
Sistema de recomendação de trilha acadêmica baseado nas afinidades do usuário.
Pontifícia Universidade Católica do Paraná.
Disciplina: Programação Lógica e Funcional.
Alunos: Nicolas Felix Hrescak.
Usuário do github: NicolasHrescak.

Passo a passo para rodar o sistema:
1 - Baixar o SWI-Prolog em: https://www.swi-prolog.org/download/stable
O utilizado para rodar em windows foi o: SWI-Prolog 9.2.9-1 for Microsoft Windows (64 bit).
2 - Teste se o download foi feito corretamente abrindo o CMD e digitando: swipl --version
se aparecer uma mensagem como: SWI-Prolog version 9.2.9 for x64-win64 então foi instalado corretamente.
Dica útil: Ao abrir o executável é eficiente marcar as caixinhas para adicionar os PATH's do programa
para o usuário automaticamente para que não precise adicionar manualmente.
3 - Baixe todos os arquivos do repositório e os guarde em uma pasta com o nome de sua preferência.
4 - Abra o arquivo "interface.pl" em algum editor de sua preferência.
5 - Na primeira linha coloque o caminho para a pasta do seu projeto, esse caminho é onde a interface vai procurar
os outros arquivos para rodar todo o projeto. Você verá algo como: " :- cd/.../... " adicione o caminho nessa linha e salve.
6 - Abra o executável do SWI-Prolog, vá em "file" e depois em "consult" e escolha para abrir o arquivo "interfacel.pl".
7 - O sistema começará a funcionar.
