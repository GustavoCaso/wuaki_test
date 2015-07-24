Rspec::Matchers.define :match_response_schema do |schema|
  match do |response|
    schema_dirctory = "#{Dir.pwd}/spec/support/api/schemas"
    schema_path = "#{schema_dirctory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, response.body, strict: true)
  end
end
