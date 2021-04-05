module AuthenticableApiUser
  extend ActiveSupport::Concern

  private

  def ready?(*)
    # Remove after
    #context[:current_user] = User.first unless context[:current_user]

    return true if context[:current_user]

    raise unauthorized_error
  end

  def unauthorized_error
    options = { status: :unauthorized, code: 401 }

    GraphQL::ExecutionError.new('Unauthorized user. Signing before continue.', options: options)
  end
end
