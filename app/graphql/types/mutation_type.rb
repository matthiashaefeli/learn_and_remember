# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_skill, mutation: Mutations::AddSkill
    field :add_user, mutation: Mutations::AddUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :verify_user, mutation: Mutations::VerifyUser
    field :add_comment, mutation: Mutations::AddComment
    field :delete_skill, mutation: Mutations::DeleteSkill
    field :update_skill, mutation: Mutations::UpdateSkill
    field :create_or_update_user_setting, mutation: Mutations::CreateOrUpdateUserSetting
  end
end
