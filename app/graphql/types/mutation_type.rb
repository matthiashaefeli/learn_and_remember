module Types
  class MutationType < Types::BaseObject
    field :add_skill, mutation: Mutations::AddSkill
    field :add_user, mutation: Mutations::AddUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
