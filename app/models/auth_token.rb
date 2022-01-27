class AuthToken
  def self.key
    ENV["JWT_KEY"]
  end

  def self.token(user)
    payload = {user_id: user.id}
    JsonWebToken.sign(payload, key: key)
  end

  def self.verify(token)
    result = JsonWebToken.verify(token, key: key)
    return nil if result[:error]
    User.find_by(id: result[:ok][:user_id])
  end
end