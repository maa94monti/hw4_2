
# encrypt a secret
secret = "tacos"
encrypted_secret = BCrypt::Password.create(secret)
puts encrypted_secret

user_entered_secret = "tacos"
result = BCrypt::Password.new(encrypted_secret) == user_entered_secret
puts result