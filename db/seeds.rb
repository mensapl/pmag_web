[
  { mensa_id: 'PL111', email: 'qwe@qwe.qwe' },
  { mensa_id: 'PL222', email: 'qwe2@qwe.qwe' },
  { mensa_id: 'PL333', email: 'qwe3@qwe.qwe' },
  { mensa_id: 'PL444', email: 'qwe4@qwe.qwe' }
].each_with_index do |user_data, index|
  User.find_or_create_by(user_data) do |user|
    user.password = 'qweqweqwe'
    token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id, expires_in: nil)
    token.update(token: "test#{index}")
  end
end
