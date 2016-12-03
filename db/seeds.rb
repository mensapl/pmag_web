[
  { email: 'qwe@qwe.qwe' },
  { email: 'qwe2@qwe.qwe' },
  { email: 'qwe3@qwe.qwe' },
  { email: 'qwe4@qwe.qwe' }
].each do |user_data|
  User.find_or_create_by(user_data) do |user|
    user.password = 'qweqweqwe'
  end
end
