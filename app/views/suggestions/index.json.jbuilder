json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :comment, :user_id
  json.url suggestion_url(suggestion, format: :json)
end
