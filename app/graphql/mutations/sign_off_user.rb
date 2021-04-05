module Mutations
  class SignOffUser < BaseMutation
    null true

    field :signed_off, Boolean, null: true

    def resolve
      context[:session][:token] = nil

      { signed_off: true }
    end
  end
end
