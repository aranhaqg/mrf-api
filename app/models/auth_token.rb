module AuthToken
  module_function

  PREFIX = 'user-id'.freeze

  def token_for_user(user)
    crypt.encrypt_and_sign("#{PREFIX}#{user.id}")
  end

  def user_from_token(token)
    return if token.blank?

    user_id = crypt.decrypt_and_verify(token).gsub(PREFIX, '').to_i
    User.find_by id: user_id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def crypt
    secret = Rails.application.credentials.secret_key_base if ['development', 'test'].include? ENV['RAILS_ENV']
    secret = Rails.application.secret_key_base if ENV['RAILS_ENV'] == 'production'

    ActiveSupport::MessageEncryptor.new(secret.byteslice(0..31))
  end
end
