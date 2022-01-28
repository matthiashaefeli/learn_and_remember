module Types
  module Input
    class CommentInputType < Types::BaseInputObject
      argument :body, String, required: true
      argument :skill_id, Integer, required: true
      argument :token, String, required: true
    end
  end
end
