require 'factory/declaration'

module Factory
  class Definition
    def initialize(options)
      @options = options
      @declarations = []
    end

    def add_attribute(name, value)
      @declarations << Declaration.new(name, value)
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

    def run
      entity = @options[:class].new
      @declarations.each do |declaration|
        entity.send("#{declaration.name}=", declaration.value)
      end
      entity
    end
  end
end
