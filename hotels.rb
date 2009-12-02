class Customer
  def initialize(name)
    @name = name
  end

  def hello
    "hi #{@name}"
  end

  def goodbye
    "goodbye #{@name}"
  end

  def name
    @name
  end
end

class Hotel
  def initialize(guests)
    @customers = guests.map {|name| Customer.new(name) }
  end

  def add(name)
    c = Customer.new(name)
    @customers << c
    c.hello
  end

  def remove(name)
    c = get(name)
    @customers.reject! {|i| i.name == name}
    c.goodbye
  end

  def get(name)
    @customers.select {|i| i.name == name}.first
  end

  def all
    @customers
  end
end
