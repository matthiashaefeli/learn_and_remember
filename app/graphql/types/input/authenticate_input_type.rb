module Types
  module Input
    class AuthenticateInputType < Types::BaseInputObject
      argument :token, String, required: true
    end
  end
end
