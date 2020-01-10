# language: pt
# encoding: utf-8
Funcionalidade: Teste de API Autoregister, sendo PF customer e PJ companies. Processo da neurotech está atrelado diretamente ao id politica/segmento 1 - PF e 3 - PJ

@regressao @customers @run
Esquema do Cenario: Post Auto Cadastro PF, sem neurotech

    Dado um name, birthDate, taxId, intermediaryId, productId, workflow, hasInvoice "<name>""<birthDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Customers sem neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PF na base Cateno

    Exemplos:
        | name                       | birthDate  | taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 

@regressao @customers @run
Esquema do Cenario: Post Auto Cadastro PJ, sem neurotech

    Dado um companyName, foundingDate, taxId, intermediaryId, productId, workflow, hasInvoice "<companyName>""<foundingDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Companies sem neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PJ na base Cateno

    Exemplos:
        | companyName                |foundingDate| taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 
    
@regressao @customers @run
Esquema do Cenario: Post Auto Cadastro PF, COM neurotech

    Dado um name, birthDate, taxId, intermediaryId, productId, workflow, hasInvoice "<name>""<birthDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Customers com neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PF na base Cateno

    Exemplos:
        | name                       | birthDate  | taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   |     

@regressao @customers @run
Esquema do Cenario: Post Auto Cadastro PJ, com neurotech

    Dado um companyName, foundingDate, taxId, intermediaryId, productId, workflow, hasInvoice "<companyName>""<foundingDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Companies com neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PJ na base Cateno

    Exemplos:
        | companyName                |foundingDate| taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 

@regressao @customers @run
Esquema do Cenario: Post Auto Cadastro - cenario negativo - portador já existente

    Dado um companyName, foundingDate, taxId, intermediaryId, productId, workflow, hasInvoice "<companyName>""<foundingDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Companies sem neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PJ na base Cateno

    Exemplos:
        | companyName                |foundingDate| taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 

@regressao @customers @run
Esquema do Cenario: Auto cadastro logo após atualização de id politica/segmento, tentativa de autocadastro com id tipo configuração cartão antigo

    Dado um companyName, foundingDate, taxId, intermediaryId, productId, workflow, hasInvoice "<companyName>""<foundingDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Companies com neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PJ na base Cateno

    Exemplos:
        | companyName                |foundingDate| taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 


@regressao @customers @run
Esquema do Cenario: Tentativa de autocadastro PF com modalidade/intermediario inexistente/inativo

    Dado um companyName, foundingDate, taxId, intermediaryId, productId, workflow, hasInvoice "<companyName>""<foundingDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Companies sem neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PJ na base Cateno

    Exemplos:
        | companyName                |foundingDate| taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 

@regressao @customers @run
Esquema do Cenario: Tentativa de autocadastro PJ com modalidade/intermediario inexistente/inativo

    Dado um companyName, foundingDate, taxId, intermediaryId, productId, workflow, hasInvoice "<companyName>""<foundingDate>""<taxId>""<intermediaryId>""<hasInvoice>""<modality>"
    Quando faco uma solicitacao POST para o servico Autoregister Companies sem neurotech
    Entao o codigo de resposta HTTP deve ser igual 201
    E deve salvar o novo portador PJ na base Cateno

    Exemplos:
        | companyName                |foundingDate| taxId         | intermediaryId | hasInvoice |modality| 
        | Hilton Mesquita Pereira    | 1998-04-09 | 05658943310   | 25             | true       |  198   | 




