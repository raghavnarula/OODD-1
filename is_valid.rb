def is_valid(s)
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