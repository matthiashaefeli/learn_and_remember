module Types
  module Input
    class CommentInputType < Types::BaseInputObject
      argument :body, String, required: true
      argument :skill_id, Integer, required: true
    end
  end
end
