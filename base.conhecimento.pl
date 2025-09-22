%Toda a minha base de conhecimento no desenvolvimento do projeto já formatado para o prolog.

trilha(inteligencia_artificial, 'Trilha focada em IA, aprendizado de máquina e estatística').
trilha(desenvolvimento_web, 'Trilha focada em criação de sites, apps e design de interfaces').
trilha(seguranca_da_informacao, 'Trilha focada em proteção de dados, criptografia e cibersegurança').
trilha(ciencia_de_dados, 'Trilha focada em análise de dados, estatística e visualização').
trilha(redes_e_infraestrutura, 'Trilha focada em redes, servidores e infraestrutura de TI').

pergunta(1,  'Você gosta de matemática?', matematica_estatistica).
pergunta(2,  'Você gosta de programar interfaces para usuários?', design_visual).
pergunta(3,  'Você se interessa por segurança digital?', criptografia).
pergunta(4,  'Você gosta de trabalhar com grandes volumes de dados?', banco_de_dados).
pergunta(5,  'Você gosta de redes de computadores?', redes).
pergunta(6,  'Você gosta de resolver problemas complexos com algoritmos?', programacao).
pergunta(7,  'Você se interessa em criar sites e aplicações web?', desenvolvimento_web).
pergunta(8,  'Você se preocupa com privacidade e proteção de dados?', seguranca_informacao).
pergunta(9,  'Você gosta de estatística?', matematica_estatistica).
pergunta(10, 'Você gosta de configurar servidores e redes?', sysadmin).
pergunta(11, 'Você gosta de aprender sobre inteligência artificial?', machine_learning).
pergunta(12, 'Você gosta de design e experiência do usuário?', design_visual).
pergunta(13, 'Você gostaria de trabalhar impedindo ataques hackers?', seguranca_informacao).
pergunta(14, 'Você se interessa por análise de dados para negócios?', visualizacao_dados).
pergunta(15, 'Você gosta de mexer com hardware e infraestrutura?', hardware_embarcado).
pergunta(16, 'Você gosta de estudar lógica?', programacao).
pergunta(17, 'Você gosta de criar aplicações móveis?', desenvolvimento_web).
pergunta(18, 'Você gostaria de investigar crimes digitais?', seguranca_informacao).
pergunta(19, 'Você se interessa por aprendizado de máquina?', machine_learning).
pergunta(20, 'Você gostaria de criar dashboards e relatórios?', visualizacao_dados).
pergunta(21, 'Você gosta de gerenciar sistemas de redes?', sysadmin).
pergunta(22, 'Você gosta de estudar modelos matemáticos?', matematica_estatistica).
pergunta(23, 'Você gosta de aprender novas linguagens de programação?', programacao).
pergunta(24, 'Você se interessa por análise de riscos de segurança?', criptografia).
pergunta(25, 'Você gosta de administrar servidores em nuvem?', sysadmin).

perfil(inteligencia_artificial, matematica_estatistica, 5).
perfil(inteligencia_artificial, machine_learning, 5).
perfil(inteligencia_artificial, programacao, 4).
perfil(inteligencia_artificial, visualizacao_dados, 3).
perfil(inteligencia_artificial, criptografia, 2).

perfil(desenvolvimento_web, design_visual, 5).
perfil(desenvolvimento_web, desenvolvimento_web, 5).
perfil(desenvolvimento_web, programacao, 4).
perfil(desenvolvimento_web, banco_de_dados, 3).
perfil(desenvolvimento_web, visualizacao_dados, 2).

perfil(seguranca_da_informacao, criptografia, 5).
perfil(seguranca_da_informacao, seguranca_informacao, 5).
perfil(seguranca_da_informacao, redes, 4).
perfil(seguranca_da_informacao, sysadmin, 3).
perfil(seguranca_da_informacao, programacao, 2).

perfil(ciencia_de_dados, matematica_estatistica, 5).
perfil(ciencia_de_dados, visualizacao_dados, 5).
perfil(ciencia_de_dados, banco_de_dados, 4).
perfil(ciencia_de_dados, programacao, 3).
perfil(ciencia_de_dados, machine_learning, 3).

perfil(redes_e_infraestrutura, redes, 5).
perfil(redes_e_infraestrutura, sysadmin, 5).
perfil(redes_e_infraestrutura, hardware_embarcado, 4).
perfil(redes_e_infraestrutura, seguranca_informacao, 3).
perfil(redes_e_infraestrutura, criptografia, 2).
