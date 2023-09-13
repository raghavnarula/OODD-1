class Book
  attr :title, :price

  # Constructor
  def initialize(title, price)
    @title = title
    @price = price
    if title.nil? || title.empty? || price.nil? || price <= 0
      raise ArgumentError, "Please Check Values"
    end
  end

  # Getter Methods for title and price
  def title
    @title
  end

  def price
    @price
  end

  # Setter methods for title and price
  def title=(title)
    if title.nil? || title.empty?
      raise ArgumentError, "Please Retype Title"
    end
    @title = title
  end

  def price=(price)
    if price.nil? || price <= 0
      raise ArgumentError, "Please Retype Price"
    end
    @title = price
  end

  # formatted price
  def formatted_price
    cents = ((@price * 100) % 100).to_i
    dollar = @price.floor
    if dollar == 0
      if cents == 1
        return "#{cents} cent only"
      else
        return "#{cents} cents only"
      end
    else
      if dollar == 1 and cents == 0
        return "#{dollar} dollar"
      elsif dollar == 1 and cents == 1
        return "#{dollar} dollar and #{cents} cent only"
      elsif dollar == 1 and cents > 1
        return "#{dollar} dollar and #{cents} cents only"
      elsif dollar > 1 and cents == 0
        return "#{dollar} dollars only"
      elsif dollar > 1 and cents == 1
        return "#{dollar} dollars and #{cents} cent only"
      else
        if cents == 0
          return "#{dollar} dollars only"
        else
          return "#{dollar} dollars and #{cents} cents only"
        end
      end
    end
  end
end

def brackets_match?(s)
  stack = []

  s.split("").each do |i|
    if i == "(" or i == "[" or i=="{"
      stack.append(i)
    end
    if stack.length == 0 and (i == "]" or i =="}" or i ==")")
      return false
    end
    if stack.length != 0 and i == "]"
      if stack[-1] != "["
        return false
      end
      stack.pop
    end


    if stack.length != 0 and i == "}"
      if stack[-1] != "{"
        return false
      end
      stack.pop
    end


    if stack.length != 0 and i == ")"
      if stack[-1] != "("
        return false
      end
      stack.pop
    end
  end

  if stack.length != 0
    return false
  end
  true
end


def highest_frequency_word(s)
  # converting sentence into array
  words = s.downcase.split(/[!?'.,; ]/)

  # Create a dictionary to store all the words only..
  dictionary = Hash.new(0)
  words.each_with_index do |word, index|
    if word != ""
      dictionary[word] += 1
    end
  end

  max_frequency = dictionary.values.max

  # Selecting the most frequent words from a dictionary
  most_freq_words = dictionary.select { |_, count| count == max_frequency }

  # Selecting the earliest word
  earliest_word = nil
  words.each_with_index do |word, index|
    if most_freq_words.include?(word) && (earliest_word.nil? || words.index(earliest_word) > index)
      earliest_word = word
    end
  end

  earliest_word
end


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


def two_sum?(a, n)
  flag = 0
  for i in 0..(a.length - 1)
    current_sum = 0
    for j in i..(a.length - 1)
      current_sum += a[j]
      if current_sum == n && a[j] != n
        flag = 1
        break
      end
    end
    break if flag == 1
  end

  if flag == 1
    true
  else
    false
  end
end

def group_anagrams(strings)
  anagram = {}
  strings.each do |i|
    sorted = i.split('').sort.join
    if anagram.key?(sorted)
      anagram[sorted] << i
    else
      anagram[sorted] = [i]
    end
  end
  res = anagram.values
  res
end

def remove_and_append_vowels(s)
  c = ""
  v = "aeiouAEIOU"
  vowels_present = ""
  s.each_char do |i|
    if v.include?(i)
      vowels_present << i
    else
      c << i
    end
  end
  res = c + vowels_present
  res
end
