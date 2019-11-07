require 'factory/version'
require 'factory/definition'
require 'ostruct'

module Factory
  @factories = {}

  def self.define(name, options, &block)
    definition = Definition.new(options)
    definition.instance_eval(&block)
    @factories[name] = definition
  end

  def self.run(name)
    @factories[name].run
  end
end
