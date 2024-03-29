# frozen_string_literal: true

require './my_methods'

RSpec.describe Enumerable do
  let(:test_array) { [2, 2, 2, 4, 8] }

  let(:test_array_1) { [1, 2, 3, 4] }

  let(:test_array_2) { [2, 2, 2, 5, 2] }
  describe '#my_each' do
    it 'returns each of the elements in the array' do
      expect(test_array_1.my_each { |element| element }).to eql(test_array_1)
    end
  end
  describe '#my_all' do
    it 'returns true if condition holds for all elements' do
      expect(test_array.my_all(&:even?)) .to eql(true)
    end
    it 'returns false if condition does not holds for all elements' do
      expect(test_array_1.my_all(&:even?)) .to eql(false)
    end
  end
  describe '#my_any' do
    it 'returns true if condition hold for any elements' do
      expect(test_array.my_any(&:even?)).to eql(true)
    end
    it "returns false if condition doesn't hold for all elements" do
      expect(test_array.my_any(&:odd?)).to eql(false)
    end
  end
  describe '#my_none' do
    it 'returns true if condition does not hold for any elements' do
      expect(test_array.my_none(&:odd?)).to eql(true)
    end
    it 'returns false if condition hold for any elements' do
      expect(test_array_1.my_none(&:even?)).to eql(false)
    end
  end
  describe '#my_count' do
    it 'returns the frequency of element in array.return the array size if parameter is not given.' do
      expect(test_array_2.my_count(2) {}).to eql(4)
    end
  end
  describe '#my_inject' do
    it 'returns the accumulated result of operation performed on each element in
    the array with initial value given as parameter.' do
      expect(test_array_2.my_inject(1) { |res, ele| res + ele }).to eql(14)
    end
  end
  describe '#my_select' do
    it 'returns a new array where element satisfies condition given in the block.' do
      expect(test_array_2.my_select(&:even?)).to eql([2, 2, 2, 2])
    end
    it 'returns a new array where element satisfies condition given in the block.' do
      expect(test_array_2.my_select { |element| element }).to eql([2, 2, 2, 5, 2])
    end
  end
  describe '#my_each_with_index' do
    it 'loop through each of the elements in the array and giving it access to it index' do
      expect(test_array_1.my_each { |element| element }).to eql(test_array_1)
    end
  end
  describe '#my_map' do
    it 'returns a new array performing operation in block on each element.' do
      expect(test_array_1.my_map { |element| element * 2 }).to eql([2, 4, 6, 8])
    end
    it 'returns a new array performing operation in block on each element.' do
      expect(test_array_1.my_map { |element| element }).to eql([1, 2, 3, 4])
    end
  end
end