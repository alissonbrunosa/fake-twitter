json.array! @users do |user| 
  json.id user.id
  json.name user.name
  json.email user.email
  json.image image_url(user)
  json.url user_path(user)
  json.value ""
end