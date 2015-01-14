json.array!(@comments) do |comment|
    json.(comment, :id, :body)
end