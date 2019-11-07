require 'test_helper'

class Bicycle
  attr_accessor :style, :size, :color, :weight, :gears
end

Factory.define :bicycle, class: Bicycle do
  add_attribute :color, :red
  add_attribute :gears, 11
end

describe Factory do
  describe 'run' do
    it 'builds an instance of bicycle' do
      bicycle = Factory.run(:bicycle)
      assert_equal :red, bicycle.color
      assert_equal 11, bicycle.gears
    end
  end
end
