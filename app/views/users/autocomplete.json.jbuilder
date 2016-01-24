json.array! @users do |user| 
  json.id user.id
  json.name user.name
  json.email user.email
  json.url user_path(user)
  json.value ""
end