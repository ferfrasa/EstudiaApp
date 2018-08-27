json.extract! @comment, :id, :user_id, :article_id, :body, :created_at, :updated_at
#json.url article_url(comment, format: :json)
json.id @comment.id
json.article_id @comment.article_id
json.body @comment.body
json.created_at @comment.created_at
json.updated_at @comment.updated_at
json.user do
  json.email @comment.user.email 
	
end
