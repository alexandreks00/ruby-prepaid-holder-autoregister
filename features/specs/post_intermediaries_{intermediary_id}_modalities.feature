# language: pt
# encoding: utf-8

@modalities @post_modalities
Funcionalidade: Post - Modalities

Cenario: Post - Cria uma Modalidade para um Intermediario
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade nao cadastrada 
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD

Cenario: Post - Criacao Modalidade Ja existente
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade ativa "134" com o nome "Prunesviolet" com a descricao "Prunesviolet"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "400"
    # E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "Modalidade já existente" 
    E sera exibido o codigo de erro "4109"
 
Esquema do Cenario: Post - Criacao Modalidade Com Segments Duplicados
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com segments duplicado "<segment_id>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "400"
    # E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "<message>" 
    E sera exibido o codigo de erro "<error_code>"

    Exemplos:
        |segment_id|message                                     |error_code|
        |1         |Foi informado mais de um segmento do tipo PF|4110      |
        |2         |Foi informado mais de um segmento do tipo PF|4110      |
        |3         |Foi informado mais de um segmento do tipo PJ|4111      |
        |4         |Foi informado mais de um segmento do tipo PJ|4111      |
        |5         |Foi informado mais de um segmento do tipo PJ|4111      |
        |6         |Foi informado mais de um segmento do tipo PF|4110      |
        |7         |Foi informado mais de um segmento do tipo PJ|4111      |


Cenario: Post - Criacao Modalidade Com Segments Não Existente
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com segments nao existente "8"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "404"
    E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "Segmento 8 não encontrado" 
    E sera exibido o codigo de erro "4202"


Cenario: Post - Criacao Modalidade Com Todos Os Segments PF
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com todos segments pf "1""2""6"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "400"
    E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "Foi informado mais de um segmento do tipo PF" 
    E sera exibido o codigo de erro "4110"

 
Cenario: Post - Criacao Modalidade Com Todos Os Segments PJ
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com todos segments pj "3""4""5""7"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "400"
    E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "Foi informado mais de um segmento do tipo PJ" 
    E sera exibido o codigo de erro "4111"

 
Esquema do Cenario: Post - Criacao Modalidade Com Segments PF e PJ
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com segments pf e pj "<segment_id_pf>""<segment_id_pj>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E os segments cadastrados devem ser salvos no BD
    E os segments cadastrados devem estar ativos no BD

    Exemplos:
        |segment_id_pf|segment_id_pj|
        |1            |3            |
        |1            |4            |
        |1            |5            |
        |1            |7            |
        |2            |3            |
        |2            |4            |
        |2            |5            |
        |2            |7            |
        |6            |3            |
        |6            |4            |
        |6            |5            |
        |6            |7            |

Esquema do Cenario: Post - Criacao Modalidade Com Segments Validos
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com segments validos "<segment_id>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E os segments cadastrados devem ser salvos no BD
    E os segments cadastrados devem estar ativos no BD

    Exemplos:
        |segment_id|
        |1         |
        |2         |
        |3         |
        |4         |
        |5         |
        |6         |
        |7         |
        
#BUG
Cenario: Post - Criacao Modalidade Com Card Configurations Duplicado
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com cards configurations duplicado "1""1"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "400"
    E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "?" 
    E sera exibido o codigo de erro "?"

#CONDUCTOR
# Cenario: Post - Criacao Modalidade Com Card Configurations Não Existente
#     Dado usuario logado como emissor
#     E um intemediario cadastrado "32"
#     E uma modalidade com cards configurations nao existente "37""54"
#     Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
#     Entao o codigo de resposta HTTP deve ser igual "400"
#     E o contrato deve ser valido "schema_error.json"
#     E sera exibido a mensagem "?" 
#     E sera exibido o codigo de erro "?"

#CONDUCTOR 
Esquema do Cenario: Post - Criacao Modalidade Com Product Não Existente
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com product nao existente "<product_id>""<commercial_origin_id>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "404"
    E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "<message>" 
    E sera exibido o codigo de erro "<error_code>"

    Exemplos:
        |product_id|commercial_origin_id|message                        |error_code|
        |59        |59                  |Produto não encontrado         |4202      |
        # |1         |59                  |Origem Comercial nao encontrado|          |

Esquema do Cenario: Post - Criacao Modalidade Com Product Valido
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com product valido "<product_id>""<commercial_origin_id>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o product cadastrado deve ser salvo no BD
    E o product cadastrado deve estar ativo no BD

    Exemplos:
        |product_id|commercial_origin_id|
        |1         |1                   |
        |2         |1                   |
        |3         |1                   |
        |4         |1                   |
        |5         |1                   |
        |6         |1                   |

Cenario: Post - Criacao Modalidade Com Processor Não Existente
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com processor nao existente "41"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "404"
    E o contrato deve ser valido "schema_error.json"
    E sera exibido a mensagem "Processadora não encontrada" 
    E sera exibido o codigo de erro "4202"

Cenario: Post - Criacao Modalidade Com Modality Configurations Auto Register
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations auto register "5""1.11""2.84"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations auto register cadastrado deve ser salvo no BD
    E o modality configurations auto register cadastrado deve estar ativo no BD


Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Auto Register - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations auto register "<configurationId>""<minimun_recharge>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|minimun_recharge|fee  |status_code|schema           |error_code|message                                                                                       | 
            |32             |7              |2.11            |10.65|400        |schema_error.json|4100      |modality_configurations.auto_register.configuration.id precisa ser um dos seguintes valores: 5|
            |32             |99             |3.11            |2.00 |400        |schema_error.json|4100      |modality_configurations.auto_register.configuration.id precisa ser um dos seguintes valores: 5|

#BUG
Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Inactivity
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations inactivity "<configurationId>""<inactivity_fee>""<inactivity_cicle>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    # E o contrato deve ser valido "<schema>"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations inactivity cadastrado deve ser salvo no BD
    E o modality configurations inactivity cadastrado deve estar ativo no BD
        Exemplos:
            |intermediary_id|configurationId|inactivity_fee|inactivity_cicle|status_code|schema                                                      | 
            |32             |16             |1.11          |30              |201        |schema_post_intermediaries_{intermediary_id}_modalities.json|
            |32             |16             |2.22          |60              |201        |schema_post_intermediaries_{intermediary_id}_modalities.json|
            |32             |16             |3.33          |90              |201        |schema_post_intermediaries_{intermediary_id}_modalities.json|

#BUG
Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Inactivity - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations inactivity "<configurationId>""<inactivity_fee>""<inactivity_cicle>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|inactivity_fee|inactivity_cicle|status_code|schema           |error_code|message| 
            |32             |7              |1.11          |30              |400        |schema_error.json|?         |?      |
            |32             |99             |2.22          |60              |400        |schema_error.json|?         |?      |
            |32             |16             |3.33          |15              |400        |schema_error.json|?         |?      |

#BUG
Cenario: Post - Criacao Modalidade Com Modality Configurations P2P
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations ptwop "6""1.33"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations ptwop cadastrado deve ser salvo no BD
    E o modality configurations ptwop cadastrado deve estar ativo no BD


Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations P2P - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations ptwop "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message                                                                             | 
            |32             |7              |2.11|400        |schema_error.json|4100      |modality_configurations.p2p.configuration.id precisa ser um dos seguintes valores: 6|
            |32             |99             |3.11|400        |schema_error.json|4100      |modality_configurations.p2p.configuration.id precisa ser um dos seguintes valores: 6|

#BUG
Cenario: Post - Criacao Modalidade Com Modality Configurations Withdraw
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations withdraw "7""1.66"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations withdraw cadastrado deve ser salvo no BD
    E o modality configurations withdraw cadastrado deve estar ativo no BD


Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Withdraw - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations withdraw "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message                                                                                  | 
            |32             |2              |2.11|400        |schema_error.json|4100      |modality_configurations.withdraw.configuration.id precisa ser um dos seguintes valores: 7|
            |32             |99             |3.11|400        |schema_error.json|4100      |modality_configurations.withdraw.configuration.id precisa ser um dos seguintes valores: 7|


Cenario: Post - Criacao Modalidade Com Modality Configurations Game Service Recharge
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations game service recharge "12""2.89"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations game service recharge cadastrado deve ser salvo no BD
    E o modality configurations game service recharge cadastrado deve estar ativo no BD

@teste
Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Game Service Recharge - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations game service recharge "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message                                                                                                | 
            |32             |7              |2.11|400        |schema_error.json|4100      |modality_configurations.game_service_recharge.configuration.id precisa ser um dos seguintes valores: 12|
            |32             |99             |3.11|400        |schema_error.json|4100      |modality_configurations.game_service_recharge.configuration.id precisa ser um dos seguintes valores: 12|

Cenario: Post - Criacao Modalidade Com Modality Configurations Card Recharge
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations card recharge "4""7.52"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations card recharge cadastrado deve ser salvo no BD
    E o modality configurations card recharge cadastrado deve estar ativo no BD

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Card Recharge - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations card recharge "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message| 
            |32             |?              |2.11|400        |schema_error.json|?         |?      |
            |32             |?              |3.11|400        |schema_error.json|?         |?      |

Cenario: Post - Criacao Modalidade Com Modality Configurations Phone Recharge
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations phone recharge "11""5.60"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations phone recharge cadastrado deve ser salvo no BD
    E o modality configurations phone recharge cadastrado deve estar ativo no BD

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Phone Recharge - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations phone recharge "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message| 
            |32             |?              |2.11|400        |schema_error.json|?         |?      |
            |32             |?              |3.11|400        |schema_error.json|?         |?      |

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Ted
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations ted "2""4.12"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations ted cadastrado deve ser salvo no BD
    E o modality configurations ted cadastrado deve estar ativo no BD

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Ted - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations ted "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message| 
            |32             |?              |2.11|400        |schema_error.json|?         |?      |
            |32             |?              |3.11|400        |schema_error.json|?         |?      |

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Payment
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations payment "1""2.54"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations payment cadastrado deve ser salvo no BD
    E o modality configurations payment cadastrado deve estar ativo no BD

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Payment - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations payment "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message| 
            |32             |?              |2.11|400        |schema_error.json|?         |?      |
            |32             |?              |3.11|400        |schema_error.json|?         |?      |

Cenario: Post - Criacao Modalidade Com Modality Configurations Online ted
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations online ted "15""3.12"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations online ted cadastrado deve ser salvo no BD
    E o modality configurations online ted cadastrado deve estar ativo no BD

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Online ted - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations online ted "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message| 
            |32             |?              |2.11|400        |schema_error.json|?         |?      |
            |32             |?              |3.11|400        |schema_error.json|?         |?      |

Cenario: Post - Criacao Modalidade Com Modality Configurations Monthly Fee
    Dado usuario logado como emissor
    E um intemediario cadastrado "32"
    E uma modalidade com modality configurations monthly fee "14""3.12"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "201"
    # E o contrato deve ser valido "schema_post_intermediaries_{intermediary_id}_modalities.json"
    E o id da modalidade cadastrada deve ser salva no BD
    E a modalidade cadastrada deve estar ativa no BD
    E o modality configurations monthly fee cadastrado deve ser salvo no BD
    E o modality configurations monthly fee cadastrado deve estar ativo no BD

Esquema do Cenario: Post - Criacao Modalidade Com Modality Configurations Monthly Fee - NEGATIVOS
    Dado usuario logado como emissor
    E um intemediario cadastrado "<intermediary_id>"
    E uma modalidade com modality configurations monthly fee "<configurationId>""<fee>"
    Quando faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E o contrato deve ser valido "<schema>"
    E sera exibido o codigo de erro "<error_code>"
    E sera exibido a mensagem "<message>"
        Exemplos:
            |intermediary_id|configurationId|fee |status_code|schema           |error_code|message| 
            |32             |?              |2.11|400        |schema_error.json|?         |?      |
            |32             |?              |3.11|400        |schema_error.json|?         |?      |