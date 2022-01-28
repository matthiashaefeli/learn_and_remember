module Types
  module Input
    class SkillInputType < Types::BaseInputObject
      argument :title, String, required: true
      argument :language, String, required: true
      argument :status, Integer, required: true
    end
  end
end
