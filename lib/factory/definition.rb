require 'factory/declaration'

module Factory
  class Definition
    def initialize(options)
      @options = options
      @declarations = []
    end

    def add_attribute(name, value, trait)
      @declarations << Declaration.new(name, value, trait)
    end

    def run(traits, overrides)
      entity = @options[:class].new
      evaluate_declarations(entity, traits)
      evaluate_overrides(entity, overrides)
      entity
    end

    def evaluate_declarations(entity, traits)
      @declarations
        .sort_by { |declaration| declaration.traitless? ? :_ : declaration.trait }
        .select { |declaration| declaration.traitless? || declaration.in?(traits) }
        .each { |declaration| entity.send("#{declaration.name}=", declaration.value) }
    end

    def evaluate_overrides(entity, overrides)
      overrides.each do |name, value|
        entity.send("#{name}=", value)
      end
    end
  end
end
