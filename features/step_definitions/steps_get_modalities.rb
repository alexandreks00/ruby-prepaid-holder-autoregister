Quando("faco uma solicitacao GET para o servico Modalities {string}") do |modality_id|
    @response =  RequestModalities.new.get_modalities_modality_id(
        HeaderSensedia.new.header_sensedia(@access_token),
        modality_id
    )
end

Quando("faco uma solicitacao GET para o servico Modalities") do
    @response =  RequestModalities.new.get_modalities(
        HeaderSensedia.new.header_sensedia(@access_token))
end

Quando("faco uma solicitacao GET para o servico Modality Configuration Types") do
    @response =  RequestModalities.new.get_modality_configuration_types(
        HeaderSensedia.new.header_sensedia(@access_token))
end

Quando("faco uma solicitacao GET para o servico Modality Configuration Types Modality Configuration Type Id {string}") do |modality_configuration_type_id|
    @response =  RequestModalities.new.get_modality_configuration_types_modality_configuration_types_id(
        HeaderSensedia.new.header_sensedia(@access_token),
        modality_configuration_type_id)
end