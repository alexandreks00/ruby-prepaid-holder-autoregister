# language: pt
# encoding: utf-8

@modalities
Funcionalidade: PATCH - Modalities

@patch_modalities
Cenario: Patch - Altera Name de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o name 
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o name alterado deve estar ativo
    

Cenario: Patch - Altera Description de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o description 
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o description alterado deve estar ativo

Cenario: Patch - Altera Segments de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o segments 
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o segments alterado deve estar ativo

Cenario: Patch - Altera Card Configurations de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o card configurations 
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o card configurations alterado deve estar ativo

Cenario: Patch - Altera Processor de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o processor 
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o processor alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Auto Register de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations auto register
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations auto register alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Inactivity de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations inactivity
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations inactivity alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Inactivity de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations inactivity
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations inactivity alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Monthly Fee de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations monthly fee
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations monthly fee alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations P2P de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations ptwop
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations ptwop alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Withdraw de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations withdraw
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations withdraw alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Game Service Recharge de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations game service recharge
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations game service recharge alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Card Recharge de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations card recharge
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations card recharge alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Phone Recharge de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations phone recharge
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations phone recharge alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Ted de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations ted
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations ted alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Payment de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations payment
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations payment alterado deve estar ativo

Cenario: Patch - Altera Modality Configurations Online Ted de uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "38"
    Quando altero o modality configurations online ted
    E faco uma solicitacao PATCH para o servico Modality
    Entao o codigo de resposta HTTP deve ser igual 204
    E no BD apenas o modality configurations online ted alterado deve estar ativo
