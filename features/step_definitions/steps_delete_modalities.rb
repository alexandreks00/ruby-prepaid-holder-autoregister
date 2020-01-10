Dado("uma modalidade ativa {string}") do |modality_id|
    @modality_id = modality_id

    MYSQL.new.query_ativa_modalidade(@modality_id)

end

Quando("faco uma solicitacao DELETE para o servico Modalities") do
    #UM NOVO ACCESS TOKEN DEVE SER GERADO, POIS NA GERAÇÃO DO DEFAULT, A MODALIDADE ESTAVA INATIVA. REGRAS DE PERFILAMENTO
    @access_token = Token.new.gera_token_emissor

    @response = RequestModalities.new.delete_modalities_modality_id(
        HeaderSensedia.new.header_sensedia(@access_token),
        @modality_id)

    expect(@response.parsed_response).to be nil
end

Entao("a modalidade deve estar inativa no banco") do
    @query1 = MYSQL.new.query_consulta_segmento(@modality_id)
    @length1 = @query1.length
    @rows1 = 0
    while @rows1 < @length1 do
        expect(@query1[@rows1]['ativo']).to eql 0
        @rows1 = @rows1 + 1
    end

    @query2 = MYSQL.new.query_consulta_operacao(@modality_id)
    @length2 = @query2.length
    @rows2 = 0
    while @rows2 < @length2 do
        expect(@query2[@rows2]['ativo']).to eql 0
        @rows2 = @rows2 + 1
    end

    @query3 = MYSQL.new.query_consulta_modelo_cartao(@modality_id)
    @length3 = @query3.length
    @rows3 = 0
    while @rows3 < @length3 do
        expect(@query3[@rows3]['ativo']).to eql 0
        @rows3 = @rows3 + 1
    end

    @query4 = MYSQL.new.query_consulta_configuracao_cartao(@modality_id)
    @length4 = @query4.length
    @rows4 = 0
    while @rows4 < @length4 do
        expect(@query4[@rows4]['ativo']).to eql 0
        @rows4 = @rows4 + 1
    end

    @query5 = MYSQL.new.query_consulta_modalidade(@modality_id)
    @length5 = @query5.length
    @rows5 = 0
    while @rows5 < @length5 do
        expect(@query5[@rows5]['ativo']).to eql 0
        @rows5 = @rows5 + 1
    end

    @query6 = MYSQL.new.query_consulta_produto_modalidade(@modality_id)
    @length6 = @query6.length
    @rows6 = 0
    while @rows6 < @length6 do
        expect(@query6[@rows6]['ativo']).to eql 0
        @rows6 = @rows6 + 1
    end
end