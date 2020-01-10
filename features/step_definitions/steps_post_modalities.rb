Dado("usuario logado como emissor") do
  @access_token = $access_token_emissor
end

Dado("um intemediario cadastrado {string}") do |intermediary_id|
  @intermediary_id = intermediary_id
end

Dado("uma modalidade nao cadastrada") do
  @name = names
  @description = descriptions

  $body = BodyModalities.new.body_post_modalities(
    @name,
    @description,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )

  # MYSQL.new.query_inativa_modalidade(@nome, @descricao)
end

Quando("faco uma solicitacao POST para o servico Intermediaries Intermediary Id Modalities") do
  @response = RequestModalities.new.post_intermediaries_intermediary_id_modalities(
    HeaderSensedia.new.header_sensedia(@access_token),
    @intermediary_id,
    $body
  )
end

Entao("o codigo de resposta HTTP deve ser igual {string}") do |code|
  expect(@response.code).to eql code.to_i
end

Entao("o contrato deve ser valido {string}") do |schema|
  expect(JSON::Validator.validate!("#{$schema_root}#{schema}", @response.body)).to eql true
end

Entao("o id da modalidade cadastrada deve ser salva no BD") do
  @query = MYSQL.new.query_consulta_modalidade(@response.parsed_response["id"])

  expect(@response.parsed_response["id"]).to eql @query[0]["id_modalidade"]
  expect(@response.parsed_response["name"]).to eql @query[0]["nome"]
  expect(@response.parsed_response["description"]).to eql @query[0]["descricao"]
  expect(@response.parsed_response["intermediary"]["id"]).to eql @query[0]["id_intermediario_fk"]
  expect(@response.parsed_response["processor"]["id"]).to eql @query[0]["id_processadora_fk"]
end

Entao("a modalidade cadastrada deve estar ativa no BD") do
  expect(@query[0]["ativo"]).to eql 1
end

Dado("uma modalidade ativa {string} com o nome {string} com a descricao {string}") do |modality_id, name, description|
  @name = name
  @description = description

  $body = BodyModalities.new.body_post_modalities(
    @name,
    @description,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )

  # MYSQL.new.query_ativa_modalidade(modality_id)
end

Entao("sera exibido a mensagem {string}") do |message|
  expect(@response.parsed_response["message"]).to eql message
end

Entao("sera exibido o codigo de erro {string}") do |error_code|
  expect(@response.parsed_response["error_code"]).to eql error_code.to_i
end

Dado("uma modalidade com segments duplicado {string}") do |segment_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments(segment_id.to_i), segments(segment_id.to_i)),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com segments nao existente {string}") do |segment_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments(segment_id.to_i)),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com todos segments pf {string}{string}{string}") do |segment_id1, segment_id2, segment_id3|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments(segment_id1.to_i), segments(segment_id2.to_i), segments(segment_id3.to_i)),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com todos segments pj {string}{string}{string}{string}") do |segment_id1, segment_id2, segment_id3, segment_id4|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments(segment_id1.to_i), segments(segment_id2.to_i), segments(segment_id3.to_i), segments(segment_id4.to_i)),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com segments pf e pj {string}{string}") do |segment_id1, segment_id2|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments(segment_id1.to_i), segments(segment_id2.to_i)),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com segments validos {string}") do |segment_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments(segment_id.to_i)),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Entao("os segments cadastrados devem ser salvos no BD") do
  @query = MYSQL.new.query_consulta_segmento(@response.parsed_response["id"])

  @length = @query.length
  cont = 0

  while cont < @length
    expect(@query[cont]["id_segmento_fk"]).to eql @response.parsed_response["segments"][cont]["id"]
    cont = cont + 1
  end
end

Entao("os segments cadastrados devem estar ativos no BD") do
  @length = @query.length
  cont = 0

  while cont < @length
    expect(@query[cont]["ativo"]).to eql 1
    cont = cont + 1
  end
end

Dado("uma modalidade com cards configurations duplicado {string}{string}") do |plastic_id, image_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations(plastic_id.to_i, image_id.to_i), card_configurations(plastic_id.to_i, image_id.to_i)),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com cards configurations nao existente {string}{string}") do |plastic_id, image_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations(plastic_id.to_i, image_id.to_i)),
    product("default", "default"),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com product nao existente {string}{string}") do |product_id, commercial_origin_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product(product_id, commercial_origin_id),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com product valido {string}{string}") do |product_id, commercial_origin_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product(product_id, commercial_origin_id),
    processor("default"),
    createObject(payment("default", "default"))
  )
end

Entao("o product cadastrado deve ser salvo no BD") do
  @query = MYSQL.new.query_consulta_produto_modalidade(@response.parsed_response["id"])

  @length = @query.length
  cont = 0

  while cont < @length
    expect(@query[cont]["id_produto_fk"]).to eql @response.parsed_response["product"]["id"]
    expect(@query[cont]["id_origem_comercial_fk"]).to eql @response.parsed_response["product"]["commercial_origin"]["id"]
    cont = cont + 1
  end
end

Entao("o product cadastrado deve estar ativo no BD") do
  @length = @query.length
  cont = 0

  while cont < @length
    expect(@query[cont]["ativo"]).to eql 1
    cont = cont + 1
  end
end

Dado("uma modalidade com processor nao existente {string}") do |processor_id|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor(processor_id.to_i),
    createObject(payment("default", "default"))
  )
end

Dado("uma modalidade com modality configurations auto register {string}{string}{string}") do |configurationId, minimun_recharge, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(auto_register(configurationId.to_i, minimun_recharge.to_f, fee.to_f))
  )
end

Dado("uma modalidade com modality configurations inactivity {string}{string}{string}") do |configurationId, fee, cicle|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(inactivity(configurationId, fee, cicle))
  )
end

Dado("uma modalidade com modality configurations ptwop {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(p2p(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations withdraw {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(withdraw(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations game service recharge {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(game_service_recharge(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations card recharge {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(card_recharge(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations phone recharge {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(phone_recharge(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations ted {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(ted(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations payment {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(payment(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations online ted {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(online_ted(configurationId, fee))
  )
end

Dado("uma modalidade com modality configurations monthly fee {string}{string}") do |configurationId, fee|
  $body = BodyModalities.new.body_post_modalities(
    names,
    descriptions,
    createArray(segments("default")),
    createArray(card_configurations("default", "default")),
    product("default", "default"),
    processor("default"),
    createObject(monthly_fee(configurationId, fee))
  )
end
