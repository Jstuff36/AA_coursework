require 'rspec'
require 'tdd'

describe '#my_uniq' do
  it 'removes duplicates' do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end

  it 'checks it does not modify original array' do
    arr = [1, 2, 3]
    expect(my_uniq(arr)).not_to equal(arr)
  end
end

describe Array do
  describe '#two_sum' do
    let(:arr) {Array.new([-1, 0, 2, -2, 1])}
    let(:arr1) {Array.new([1, 0, 2, 2, 1])}
    it 'finds all pair of positions that sums to 0' do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
    it 'returns [] when no pairs found that sum to 0'do
      expect(arr1.two_sum).to eq([])
    end
  end

  describe "#my_transpose" do
    let(:arr) {Array.new([[0, 1, 2], [3, 4, 5], [6, 7, 8]])}
    it "it transposes an array" do
      expect(arr.my_transpose). to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end
end

describe '#stock_picker' do
  it 'finds the most profitable pair of stock prices' do
    arr_prices = [2, 5, 36, 67, 4, 10]
    expect(stock_picker(arr_prices)).to eq([0, 3])
  end 
end
