json.array!(@app_parameters) do |app_parameter|
  json.extract! app_parameter, :id, :group, :code, :value, :description
  json.url app_parameter_url(app_parameter, format: :json)
end
