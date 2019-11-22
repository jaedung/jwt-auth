class Authentication
  JWT_SECRET = Rails.application.secrets.secret_key_base
  JWT_ALGORITHM = "HS256"

  def self.encode
    payload = {
      secret: SecureRandom.hex,
      exp: (DateTime.now + 10.seconds).to_i
    }

    JWT.encode(payload, JWT_SECRET, JWT_ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, JWT_SECRET, true, { algorithm: JWT_ALGORITHM })
  end
end
