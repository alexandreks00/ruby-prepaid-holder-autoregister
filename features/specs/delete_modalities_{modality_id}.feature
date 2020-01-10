# language: pt
# encoding: utf-8

@modalities
Funcionalidade: DELETE - Modalities

@delete_modalities
Esquema do Cenario: Delete - Inativar uma Modalidade
    Dado usuario logado como emissor
    E uma modalidade ativa "<modality_id>"
    Quando faco uma solicitacao DELETE para o servico Modalities
    Entao o codigo de resposta HTTP deve ser igual 204
    E a modalidade deve estar inativa no banco

    Exemplos:
        |modality_id|
        |36         |