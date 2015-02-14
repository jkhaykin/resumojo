json.array!(@resuploads) do |resupload|
  json.extract! resupload, :id, :user_id
  json.url resupload_url(resupload, format: :json)
end
