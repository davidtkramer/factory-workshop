## About

This is the repository for a Ruby metaprogramming workshop I designed and held at Redtail Technology in 2019. The workshop teaches metaprogramming techniques through test-driven construction of a simple data factory modeled after [FactoryBot](https://github.com/thoughtbot/factory_bot). Topics covered include:

- executing blocks in the context of another class using `instance_exec`
- using `method_missing` to create dynamic domain-specific languages
- using proxy classes to enable context-dependent functionality

By the end of the workshop, you'll have a working data factory that supports traits and attribute overrides

```ruby
class Bicycle
  attr_accessor :style, :size, :color, :weight, :gears
end

Factory.define :bicycle, class: Bicycle do
  size :medium
  color :red

  trait :road do
    style :road
    gears 22
    weight 20
  end

  trait :fixed_gear do
    style :fixed_gear
    gears 1
    weight 17
  end

  trait :blue do
    color :blue
  end
end

it 'builds a large, blue road bike' do
  bicycle = Factory.run(:bicycle, :road, :blue, size: :large)
  assert_equal :large, bicycle.size
  assert_equal :blue, bicycle.color
  assert_equal :road, bicycle.style
  assert_equal 22, bicycle.gears
  assert_equal 20, bicycle.weight
end
```

## Directory

The workshop contains 6 lessons. Each lesson has a corresponding branch. Run `git checkout [branch name]` to view the branch locally or use the links below to view on github.

| Branch Name | GitHub Link |
| --- | --- |
| `1-intro` | [Intro](https://github.com/davidtkramer/factory-workshop/tree/1-intro) |
| `2-blocks` | [Blocks](https://github.com/davidtkramer/factory-workshop/tree/2-blocks) |
| `3-basic-dsl` | [Basic DSL](https://github.com/davidtkramer/factory-workshop/tree/3-basic-dsl) |
| `4-method-missing` | [Method Missing Refactor](https://github.com/davidtkramer/factory-workshop/tree/4-method-missing) |
| `5-traits-simple` | [Traits - Simple](https://github.com/davidtkramer/factory-workshop/tree/5-traits-simple) |
| `5-traits-proxy` | [Traits - With Proxy](https://github.com/davidtkramer/factory-workshop/tree/5-traits-proxy) |
| `5-traits-multiple` | [Traits - Multiple](https://github.com/davidtkramer/factory-workshop/tree/5-traits-multiple) |
| `6-attribute-overrides` | [Attribute Overrides](https://github.com/davidtkramer/factory-workshop/tree/6-attribute-overrides) |

## Installation

Clone this repository

```
git clone https://github.com/davidtkramer/factory-workshop.git
```

Install dependencies

```
bundle install
```

If you get an error about an incorrect bundler version, run the command below and then try running bundle install again

```
gem update --system
```

If that still doesn't fix it, then install the latest version of bundler and then run bundle install again

```
gem install bundler
```

Checkout the first branch

```
git checkout 1-intro
```

Run the tests in watch mode

```
bundle exec guard
```
