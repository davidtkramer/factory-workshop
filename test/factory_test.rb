require 'test_helper'

class Bicycle
  attr_accessor :style, :size, :color, :weight, :gears
end

describe Factory do
  before do
    Factory.define :bicycle, class: Bicycle do
      size :medium
      color :red

      trait :road do
        style :road
        gears 22
        weight 20
      end

      trait :fixed_gear do
        style :fixed_gear
        gears 1
        weight 17
      end
    end
  end

  it 'builds a bike with default attributes' do
    bicycle = Factory.run(:bicycle)
    assert_equal :medium, bicycle.size
    assert_equal :red, bicycle.color
  end

  it 'builds a road bike' do
    bicycle = Factory.run(:bicycle, :road)
    assert_equal :medium, bicycle.size
    assert_equal :red, bicycle.color
    assert_equal :road, bicycle.style
    assert_equal 22, bicycle.gears
    assert_equal 20, bicycle.weight
  end

  it 'builds a fixed gear bike' do
    bicycle = Factory.run(:bicycle, :fixed_gear)
    assert_equal :medium, bicycle.size
    assert_equal :red, bicycle.color
    assert_equal :fixed_gear, bicycle.style
    assert_equal 1, bicycle.gears
    assert_equal 17, bicycle.weight
  end
end
