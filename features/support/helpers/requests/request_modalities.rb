class RequestAutoRegister

  def post_autoregister_customers(headers, body)
    Http.post("/prepaid-holder/v3/autoregister/customers",
              :headers => headers,
              :body => body)
  end

  def post_autoregister_companies(headers, body)
    Http.post("/prepaid-holder/v3/autoregister/companies",
              :headers => headers,
              :body => body)
  end

  def get_modality_configuration_types(headers)
    Http.get("/prepay-backoffice/v1/modality-configuration-types",
             :headers => headers)
  end

  def get_modality_configuration_types_modality_configuration_types_id(headers, modality_configuration_types_id)
    Http.get("/prepay-backoffice/v1/modality-configuration-types/#{modality_configuration_types_id}",
             :headers => headers)
  end

  def delete_modalities_modality_id(headers, modality_id)
    Http.delete("/prepay-backoffice/v1/modalities/#{modality_id}",
                :headers => headers)
  end

  def patch_modalities_modality_id(headers, modality_id, body)
    Http.patch("/prepay-backoffice/v1/modalities/#{modality_id}",
               :headers => headers,
               :body => body)
  end
end
