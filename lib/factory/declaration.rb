class Declaration
  attr_reader :name, :value, :trait

  def initialize(name, value, trait = nil)
    @name = name
    @value = value
    @trait = trait
  end

  def traitless?
    @trait.nil?
  end

  def in?(traits)
    traits.include?(@trait)
  end
end
