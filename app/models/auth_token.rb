class AuthToken
  def self.key
    ENV["JWT_KEY"]
  end

  def self.token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, key, 'HS256')
  end

  def self.verified_user(token)
    begin
      decoded_array = JWT.decode(token, key, true, { algorithm: 'HS256' })
      payload = decoded_array.first
    rescue #JWT::VerificationError
      return nil
    end

    User.find(payload['user_id'])
  end
end