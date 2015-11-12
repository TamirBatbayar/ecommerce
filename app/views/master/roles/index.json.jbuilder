json.array!(@master_roles) do |master_role|
  json.extract! master_role, :id, :name
  json.url master_role_url(master_role, format: :json)
end
