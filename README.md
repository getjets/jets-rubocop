# RuboCop for Jets

This gem provides RuboCop configuration in a Jets project.

Includes:
- base config from [standard](https://github.com/testdouble/standard)
- [`rubocop-rspec`](https://github.com/rubocop-hq/rubocop-rspec) cops

## Installation

Add this line to your application's Gemfile:

```ruby
gem "jets-rubocop", path: "gems/jets-rubocop"
```

or to your engine's Gemfile and `.gemspec`:

```ruby
# Gemfile
gem "jets-rubocop", path: "../../gems/jets-rubocop"

# .gemspec
s.add_development_dependency "jets-rubocop"
```

## Usage

Add to your `.rubocop.yml`:

```yml
inherit_gem:
  jets-rubocop: config/base.yml
```

## Custom cops

- `Lint/Env` – checks for the presence of `ENV` or `Rails.env`.

Use it to prevent environment dependent checks in your code:

```yml
require:
  - jets/rubocop/cop/lint_env

Lint/Env:
  Enabled: true
  Exclude:
    - 'lib/tasks/**/*'
    - 'config/environments/**/*'
    - 'config/*.rb'
    - 'spec/*_helper.rb'
    - 'spec/**/support/**/*'
    - 'Rakefile'
    - 'Gemfile'
```
