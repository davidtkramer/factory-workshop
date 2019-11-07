require 'factory/declaration'

module Factory
  class Definition
    def initialize(options)
      @options = options
      @declarations = []
    end

    def add_attribute(name, value)
      @declarations << Declaration.new(name, value, @trait)
    end

    def method_missing(name, *args, &block)
      if args.empty?
        super
      else
        add_attribute(name, args[0])
      end
    end

    def respond_to_missing?(*)
      super
    end

    def trait(name, &block)
      @trait = name
      instance_eval(&block)
      @trait = nil
    end

    def run(trait)
      entity = @options[:class].new
      @declarations
        .select { |declaration| declaration.traitless? || declaration.in?(trait) }
        .each { |declaration| entity.send("#{declaration.name}=", declaration.value) }
      entity
    end
  end
end
