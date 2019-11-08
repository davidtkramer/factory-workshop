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

    def run(trait)
      entity = @options[:class].new
      @declarations
        .sort_by { |declaration| declaration.traitless? ? :_ : declaration.trait }
        .select { |declaration| declaration.traitless? || declaration.in?(trait) }
        .each { |declaration| entity.send("#{declaration.name}=", declaration.value) }
      entity
    end
  end
end
