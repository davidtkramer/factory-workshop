require 'test_helper'

class Bicycle
  attr_accessor :style, :size, :color, :weight, :gears
end

describe Factory do
  before do
    Factory.define :bicycle, class: Bicycle do
      add_attribute :color, :red
      add_attribute :gears, 11
      add_attribute :style, :road
      add_attribute :weight, 20
      add_attribute :size, :medium
    end
  end

  it 'builds an instance of bicycle' do
    bicycle = Factory.run(:bicycle)
    assert_equal :red, bicycle.color
    assert_equal 11, bicycle.gears
    assert_equal :road, bicycle.style
    assert_equal 20, bicycle.weight
    assert_equal :medium, bicycle.size
  end
end
