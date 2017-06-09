json.extract! paper, :id, :url, :company, :content, :comment, :created_at, :updated_at
json.url paper_url(paper, format: :json)
