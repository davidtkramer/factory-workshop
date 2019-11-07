require 'test_helper'

class Bicycle
  attr_accessor :style, :size, :color, :weight, :gears
end

describe Factory do
  before do
    Factory.define :bicycle, class: Bicycle do
      color :red
      gears 22
      style :road
      weight 20
      size :medium
    end
  end

  it 'builds an instance of bicycle' do
    bicycle = Factory.run(:bicycle)
    assert_equal :red, bicycle.color
    assert_equal 22, bicycle.gears
    assert_equal :road, bicycle.style
    assert_equal 20, bicycle.weight
    assert_equal :medium, bicycle.size
  end
end
