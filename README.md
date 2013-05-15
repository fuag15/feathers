# Revitalization of portfolio site

my portfolio site

## Detailed Docs

- install and `rake doc:view`
- [New to rails?][rails-rdoc]

## Local Install

This package is set up to use some external tools:

- [git-flow][git-flow]
- [rvm][rvm]
- [postgresql][postgresql]
- [qt][qt-website]

First you will need to set up a postgresql user for the database:

    sudo -u postgres createuser --createdb --pwprompt feathers
    # make password feathers
    # make superuser

To set up a local env clone and cd into cloned directory then:

    bundle install
    rake db:setup
    foreman start

You should be able to view the site on `localhost:3000`, or [here][local-host]

## Current Hosts

- N/A

## Dev Guidlines

- Use git flow
- Use the issue tracker
- Comment
- Test
- Keep docs up to date!

## Roadmap

- uploaders / mailers
- views
- comments
- tests / optimization
- add markdown parsing
- add pagination
- modernize contact page
- host and transfer data

[local-host]: http://localhost:3000 "Local default server port"
[postgresql]: http://postgresql.org "Postgresql Official Site"
[rvm]: http://rvm.io "Ruby Versioning Manager Official Site"
[git-flow]: http://github.com/nvie/gitflow "Git-flow plugin page"
[local-rdoc]: http://localhost:3001/doc/app "Local generated rdoc"
[rails-rdoc]: rails_primer.rdoc "Local rails default doc"
[qt-website]: http://qt-project.org "Qt Official Project Page"