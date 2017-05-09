require 'minitest/spec'
require 'minitest/autorun'

# Given an array, find the int that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.
class FindOddInt
  def find(arr)
    counts = get_counts(arr)

    counts.each do |num, count|
      if count.odd?
        return num
      end
    end
  end

  def get_counts(arr)
    counts = {}
    arr.each do |num|
      if counts.key?(num)
        counts[num] += 1
      else
        counts[num] = 1
      end
    end
    counts
  end
end

describe FindOddInt do
  before do
    @test_arr = [1,2,1,2,1]
    @finder = FindOddInt.new
  end

  it "finds that number imperatively" do
    @finder.find(@test_arr).must_equal 1
  end

  it "finds it more functionally" do
    @test_arr.detect { |n| @test_arr.count(n).odd? }.must_equal 1
  end

  it "cleverly finds that number" do
    @test_arr.reduce(:^).must_equal 1
  end
end

