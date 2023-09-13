def max_sub_array(nums)
  maxi = -100000000
  finalSum = 0

  nums.each { |i|
    finalSum += i
    maxi = [finalSum, maxi].max
    if finalSum < 0
      finalSum = 0
    end
  }
  maxi
end

puts max_sub_array([10,20,30,0,00,10])

