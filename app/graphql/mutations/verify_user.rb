# frozen_string_literal: true

module Mutations
  class VerifyUser < Mutations::BaseMutation
    argument :params, Types::Input::VerifyUserInputType, required: true

    field :message, String, null: false

    def resolve(params:)
      verify_id = params[:verify_id]

      begin
        user = User.find_by(verify_id:)
        user.verified = true
        user.verify_id = nil
        user.save!

        return unless user&.verified

        {
          message: 'verified'
        }
      rescue ActiveRecord::RecordNotFound
        GraphQL::ExecutionError.new('Record not found')
      end
    end
  end
end
