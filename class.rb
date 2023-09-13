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
        puts "#{cents} cent only"
      else
        puts "#{cents} cents only"
      end
    else
      if dollar == 1 and cents == 0
        puts "#{dollar} dollar"
      elsif dollar == 1 and cents == 1
        puts "#{dollar} dollar and #{cents} cent only"
      elsif dollar == 1 and cents > 1
        puts "#{dollar} dollar and #{cents} cents only"
      elsif dollar > 1 and cents == 0
        puts "#{dollar} dollars only"
      elsif dollar > 1 and cents == 1
        puts "#{dollar} dollars and #{cents} cent only"
      else
        if cents == 0
          puts "#{dollar} dollars only"
        else
          puts "#{dollar} dollars and #{cents} cents only"
        end
      end
    end
  end
end

# a = Book.new('harry',0.10)
# a.formatted_price
