[
  { mensa_id: 'PL111', email: 'qwe@qwe.qwe', password: 'qweqweqwe' },
  { mensa_id: 'PL222', email: 'qwe2@qwe.qwe', password: 'qweqweqwe' },
  { mensa_id: 'PL333', email: 'qwe3@qwe.qwe', password: 'qweqweqwe' },
  { mensa_id: 'PL444', email: 'qwe4@qwe.qwe', password: 'qweqweqwe' }
].each_with_index do |user_data, index|
  user = User.find_by(mensa_id: user_data[:mensa_id])
  unless user
    user = User.create(user_data)
    token = Doorkeeper::AccessToken.create!(resource_owner_id: user.id, expires_in: nil)
    token.update(token: "test#{index}")
  end
end
