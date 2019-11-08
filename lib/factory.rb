require 'factory/version'
require 'factory/definition'
require 'factory/definition_proxy'
require 'ostruct'

module Factory
  @factories = {}

  def self.define(name, options, &block)
    definition = Definition.new(options)
    proxy = DefinitionProxy.new(definition)
    proxy.instance_eval(&block)
    @factories[name] = definition
  end

  def self.run(name, *traits, **overrides)
    @factories[name].run(traits, overrides)
  end
end
