require 'minitest/spec'
require 'minitest/autorun'

# You are given an array of strings and an integer k.
# Your task is to return the first longest string
# consisting of k consecutive strings taken in the array

def longest_consec(strarr, k)
  return '' if k <= 0
  return '' if k > strarr.length

  longest_string = ''

  strarr.each_with_index.map { |str, i| [str.length, i] }.max(k).sort {|a, b| a[1] <=> b[1] }.each do |str|
    longest_string += strarr[str[1]]
  end

  longest_string
end

describe 'Consecutive Strings' do
  it 'returns the first longest string consisting of k consecutive strings' do
    longest_consec(%w(zone abigail theta form libe zas), 2).must_equal 'abigailtheta'
    longest_consec(%w(itvayloxrp wkppqsztdkmvcuwvereiupccauycnjutlv vweqilsfytihvrzlaodfixoyxvyuyvgpck), 2).must_equal "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
    longest_consec(%w(ejjjjmmtthh zxxuueeg aanlljrrrxx dqqqaaabbb oocccffuucccjjjkkkjyyyeehh), 1).must_equal "oocccffuucccjjjkkkjyyyeehh"
  end
end
