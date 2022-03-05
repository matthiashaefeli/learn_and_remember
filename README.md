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
  fetchLanguages {
    name
    id
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
  fetchSkill(id: 1) {
    id
    title
    status
		language {
      label
    }
    user {
      id
      name
      email
      verified
    }
    comments {
      body
      user {
        name
      }
    }
  }
}

query {
  fetchSkillsByUser(userId: 3, status: 1, page: 1) {
    title
    language {
    	label
    }
    status
  }
}
query {
  fetchSkillsByStatus(status: 2, page: 1) {
    title
    language {
    	label
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
  fetchSkillsByLanguage(language: "Ruby", page: 1) {
    title
    body
    language {
      label
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
  fetchUserSettings(userId: 3) {
    id
    firstMonth
    fiveMonth
    year
    user {
      name
      email
      verified
    }
  }
}

mutation {
  createOrUpdateUserSetting(input: {
      authenticate: {
        token: ""
      },
      params: {
        firstMonth: false,
        fiveMonth: true,
        year: true
      }
  }) {
    setting {
      id
      firstMonth
      fiveMonth
      year
      user {
        id
        name
        email
        verified
      }
    }
  }
}

mutation {
  addSkill(input: { authenticate: { token: "" }, 
    								params: { title: "GraphQL notes",
    													language: "Ruby",
    													status: 2 }
  									}
  				)
  	{
    skill {
    id
    title
    status
		language {
      label
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
  addUser(input: { params: { name: "username", email: "t20@t.com", password: "pass" }}) {
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
  signInUser(input: { params: { name: "name 1", email: "email1@email.com", password: "pass" }}) {
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
    params: { body: "comment body",
      				skillId: 1 }
  }) {
    comment {
      body
      skill {
        title
      }
			user {
        email
        name
      }
    }
  }
}

mutation {
  deleteSkill(input: {
    authenticate: { token: "" },
    skillId: 1
  })  {
    skill {
      id
    }
  }
}
```
# Rubocop

rubocop --require rubocop-rails