module Types
  class MutationType < Types::BaseObject
    field :add_skill, mutation: Mutations::AddSkill
  end
end
