module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :fetch_skills, resolver: Queries::FetchSkills
    field :fetch_skill, resolver: Queries::FetchSkill
    field :fetch_comments, resolver: Queries::FetchComments
    field :fetch_comment, resolver: Queries::FetchComment
  end
end
