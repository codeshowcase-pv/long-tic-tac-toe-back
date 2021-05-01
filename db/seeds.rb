# frozen_string_literal: true

users_data = [
  { name: 'Павел Владимирович', login: 'pavel', password: 'pavel' },
  { name: 'Антониан', login: 'anton', password: 'anton' }
]

users_data.each do |data|
  User.find_or_create_by!(login: data[:login]) do |user|
    user.name     = data[:name]
    user.password = data[:password]
  end
end
