# Github Team Remover

## Usage

```ruby
github-team-remover \
  --organization FlatstackSchool, or --o \
  --login github-login, or --l \
  --password github-password, or --p \
optional
  --color color, like blue, or --c \
  --verbose or --v
  --delete  or --d
```

## Install

```bash
bin/bootstrap
```

## Quality tools

* `bin/quality` based on [RuboCop](https://github.com/bbatsov/rubocop)
* `.rubocop.yml` describes active checks

## Develop

`bin/build` checks your specs and runs quality tools
