module Factory
  class DefinitionProxy
    def initialize(definition, options = {})
      @definition = definition
      @options = options
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

    def add_attribute(name, value)
      @definition.add_attribute(name, value, @options[:trait])
    end

    def trait(name, &block)
      proxy = self.class.new(@definition, trait: name)
      proxy.instance_eval(&block)
    end
  end
end
