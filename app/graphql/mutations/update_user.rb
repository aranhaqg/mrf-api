module Mutations
  class UpdateUser < BaseMutation
    include AuthenticableApiUser

    argument :name, String, required: true

    field :user, Types::UserType, null: false

    def resolve(name: nil)
      ready?
      user = context[:current_user]
      user.update(name: name)

      { user: user }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
