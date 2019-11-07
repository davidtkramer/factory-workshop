require 'test_helper'

def map_implicit(array)
  result = []
  array.each do |item|
    result << yield(item)
  end
  result
end

def map_explicit(array, &block)
  result = []
  array.each do |item|
    result << block.call(item)
  end
  result
end

describe 'map' do
  it 'maps each value to a new array using the provided implicit block' do
    array = [1, 2, 3, 4]
    result = map_implicit(array) { |item| item * 2 }
    assert_equal [2, 4, 6, 8], result
  end

  it 'maps each value to a new array using the provided explicit block' do
    array = [1, 2, 3, 4]
    result = map_explicit(array) { |item| item * 2 }
    assert_equal [2, 4, 6, 8], result
  end
end

def select(array, &block)
  result = []
  array.each do |item|
    result << item if block.call(item)
  end
  result
end

describe 'select' do
  it 'returns array with values that return true from the provided block' do
    array = [1, 2, 3, 4]
    result = select(array) { |item| item.even? }
    assert_equal [2, 4], result
  end
end
