# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :fetch_skills, resolver: Queries::FetchSkills
    field :fetch_skill, resolver: Queries::FetchSkill
    field :fetch_skills_by_user, resolver: Queries::FetchSkillsByUser
    field :fetch_skills_by_status, resolver: Queries::FetchSkillsByStatus
    field :fetch_skills_by_language, resolver: Queries::FetchSkillsByLanguage
    field :fetch_comments, resolver: Queries::FetchComments
    field :fetch_comment, resolver: Queries::FetchComment
    field :fetch_languages, resolver: Queries::FetchLanguages
    field :fetch_user_settings, resolver: Queries::FetchUserSettings
  end
end
