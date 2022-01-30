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

```
query {
  fetchSkills {
    id
    title
    language {
    	name
    }
    user {
      name
      email
      verified
    }
    status
  }
}

query {
  fetchComments {
    id
    body
    skill {
      	title
      	language {
          name
        }
      	user {
          name
          email
        }
      }
    user {
      name
      email
    }
  }
}

query {
  fetchComment(id: 1) {
    id
    body
    skill {
      	title
      	language {
          name
        }
      	user {
          name
          email
        }
      }
    user {
      name
      email
    }
  }
}

query {
  fetchSkill(id: 2) {
    id
    title
    status
		language {
      name
    }
    user {
      name
      email
      verified
    }
  }
}

mutation {
  addSkill(input: { authenticate: { token: "" }, 
    								params: { title: "GraphQL notes",
    													languageId: 1,
    													status: 2 }}) {
    skill {
    id
    title
    status
		language {
      name
    }
    user {
      name
      email
      verified
    }
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
      verified
    }
  }
}


mutation {
  addComment(input: {
    authenticate: { token: "" },
    params: { body: "",
      				skillId: 16 }
  }) {
    comment {
      body
      skillId
				userId
    }
  }
}
```
