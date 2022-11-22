# rails-template

This repo provides a template for new PUL Rails applications,
and a process for maintaining and updating that template with Docker.

It has CI configuration to confirm that the template matches the output from Docker,
and to check that a new repo built from the template will pass its own tests.

## Create new repo from template

First, in github, create a new repo, but do not add any files.
Then copy the contents of `template-dir` and start a new repo.
(Change `my-new-repo` to a name of your choice.)
```sh
git clone https://github.com/pulibrary/rails-template.git
cp -a rails-template/template-dir my-new-repo
cd my-new-repo
# TODO: search and replace rails-template
git init
git remote add origin https://github.com/pulibrary/my-new-repo.git
```

## Maintain and update the template

- In a branch, make the necessary changes to `docker-context`.
- Run `./test-docker.sh` and copy changed files from `template-new` to `template-dir`
- Rerun `./test-docker.sh` to confirm that docker and template are sync.
- Run `./test-rails.sh` to check that the new template passes its own tests.
- Push changes to github.