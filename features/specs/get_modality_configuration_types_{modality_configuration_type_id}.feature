# language: pt
# encoding: utf-8

@modalities
Funcionalidade: GET - Modalities

@get_modalities
Esquema do Cenario: Get - Consulta detalhe tipo de configuracao da modalidade alvo
    Dado usuario logado como emissor
    Quando faco uma solicitacao GET para o servico Modality Configuration Types Modality Configuration Type Id "<modality_configuration_type_id>"
    Entao o codigo de resposta HTTP deve ser igual 200
    E o contrato deve ser valido "schema_get_modality_configuration_types_{modality_configuration_type_id}.json"

    Exemplos:
        | modality_configuration_type_id |
        | 1                              |