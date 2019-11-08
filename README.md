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

## Directory

Each step in the tutorial has a corresponding branch. Run `git checkout [branch name]` to view the branch locally or use the links below to view on github.

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
