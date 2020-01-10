Quando("faco uma solicitacao PATCH para o servico Modality") do
  @response = RequestModalities.new.patch_modalities_modality_id(
    HeaderSensedia.new.header_sensedia(@access_token),
    @modality_id,
    BodyModalities.new.body_patch_modalities(
      name,
      description,
      createArray(segments(2)),
      createArray(card_configurations(1, 1)),
      product(1, 1),
      createArray(modality_configurations(1, 2.00))
    )
  )
  expect(@response.parsed_response).to be nil
end
