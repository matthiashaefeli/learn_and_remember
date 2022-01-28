README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Graphql queries

query {
  fetchSkills {
    id
    title
    language
    status
  }
}

query {
  fetchComments {
    id
    body
    skillId
    userId
  }
}

query {
  fetchComment(id: 0) {
    id
    body
    skillId
    userId
  }
}

query {
  fetchSkill(id: 0) {
    id
    title
    language
    status
  }
}

mutation {
  addSkill(input: { params: { title: "", language: "", status: 0, token: ""}}) {
    skill {
      id
      title
      language
      userId
      status
    }
  }
}

mutation {
  addUser(input: { params: { name: "", email: "", password: "" }}) {
    authenticate {
      token
    }
    user {
      name
      email
    }
  }
}

mutation {
  signInUser(input: { params: { name: "", email: "", password: "" }}) {
		authenticate {
      token
    }
    user {
      name
      email
    }
  }
}


mutation {
  addComment(input: {
    params: { body: "", skillId: 0, token: ""}
  }) {
    comment {
      body
      skillId
				userId
    }
  }
}
