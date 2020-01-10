class BodyModalities
  def body_post_modalities(name, description, segments, card_configurations, product, processor, modality_configurations)
    $body = {
      "name": name,
      "description": description,
      "segments": segments,
      "card_configurations": card_configurations,
      "product": product,
      "processor": processor,
      "modality_configurations": modality_configurations,
    }.to_json
  end

  # def body_patch_modalities(name, description, segments, card_configurations, processor, modality_configurations)
  #   $body = {
  #     "name": name,
  #     "description": description,
  #     "segments": segments,
  #     "card_configurations": card_configurations,
  #     "processor": processor,
  #     "modality_configurations": modality_configurations,
  #   }.to_json
  # end
end
