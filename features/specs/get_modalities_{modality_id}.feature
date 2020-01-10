# language: pt
# encoding: utf-8

@modalities
Funcionalidade: GET - Modalities

@get_modalities
Esquema do Cenario: Get - Consulta modalidade alvo
    Dado usuario logado como emissor
    Quando faco uma solicitacao GET para o servico Modalities "<modality_id>"
    Entao o codigo de resposta HTTP deve ser igual 200
    E o contrato deve ser valido "schema_get_modalities_{modality_id}.json"

    Exemplos:
        |modality_id|
        |38         |