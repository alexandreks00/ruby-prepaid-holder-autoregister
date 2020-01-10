# language: pt
# encoding: utf-8

@modalities
Funcionalidade: GET - Modalities

@get_modalities
Cenario: Get - Consulta tipos de configuracoes da modalidade
    Dado usuario logado como emissor
    Quando faco uma solicitacao GET para o servico Modality Configuration Types
    Entao o codigo de resposta HTTP deve ser igual 200
    E o contrato deve ser valido "schema_get_modality_configuration_types.json"