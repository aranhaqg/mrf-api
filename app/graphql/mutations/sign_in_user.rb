module Mutations
	class SignInUser < BaseMutation
		null true

		argument :credentials, Types::AuthProviderCredentialsInput, required: false

		field :token, String, null: true
		field :user, Types::UserType, null: true

		def resolve(credentials: nil)
      # basic validation
      return GraphQL::ExecutionError.new("Invalid input: missing credentials") unless credentials

      user = User.find_by email: credentials[:email]

      # ensures we have the correct user
      return GraphQL::ExecutionError.new("User not found") unless user
      return GraphQL::ExecutionError.new("Invalid input: wrong password") unless user.authenticate(credentials[:password])
      

      # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{ user.id }")
      
      context[:session][:token] = token

      { user: user, token: token }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
	end
end