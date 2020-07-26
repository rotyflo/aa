# Advanced Ruby

**Becoming a Rubyist**
  * Implicit Returns
  * Omitting parentheses for method calls with no arguments
  * Use single line conditionals when possible
  * Use built-in methods
  * Use enumerables to iterate

**Common Enumerables**
  * all?
  * any?
  * none?
  * one?
  * count
  * sum
  * max and min
  * flatten

**Symbols**
  * Symbols are Immutable
  * Symbols as hash keys

**Default Arguments and Option Hashes**
  * Default Arguments
  * Option Hashes

**Splat Operator**
  * Using splat to accept additional arguments
  * Using splat to decompose an array
  * Using splat to decompose a hash

**Inject**
  * Inject with only a block
  * Inject with a default accumulator
  

## Becoming a Rubyist

### Implicit Returns

```ruby
# Less preferred
def get_avg(num_1, num_2)
    return (num_1 + num_2) / 2
end

# Preferred by a Rubyist
def get_avg(num_1, num_2)
    (num_1 + num_2) / 2
end
```

### Omitting parentheses for method calls with no arguments

```ruby
def say_hi
    puts "hi"
end

# Less preferred
say_hi()

# Preferred by a Rubyist
say_hi
```

### Use single line conditionals when possible

```ruby
raining = true

# Less preferred
if raining
    puts "don't forget an umbrella!"
end

# Preferred by a Rubyist
puts "don't forget an umbrella!" if raining
```

### Use built-in methods

```ruby
num = 6

# Less preferred
p num % 2 == 0

# Preferred by a Rubyist
p num.even?
```

```ruby
people = ["Joey", "Bex", "Andrew"]

# Less preferred
p people[people.length - 1]

# Preferred by a Rubyist
p people[-1]
p people.last
```

### Use enumerables to iterate

```ruby
# Less preferred
def repeat_hi(num)
    i = 0
    while i < num
        puts "hi"
        i += 1
    end
end

# Preferred by a Rubyist
def repeat_hi(num)
    num.times { puts "hi" }
end
```

```ruby
# Less preferred
def all_numbers_even?(nums)
    nums.each do |num|
        return false if num % 2 != 0
    end

    true
end

# Preferred by a Rubyist
def all_numbers_even?(nums)
    nums.all? { |num| num.even? }
end
```

## Common Enumerables

### all?

```ruby
p [2, 4, 6].all? { |el| el.even? }  # => true
p [2, 3, 6].all? { |el| el.even? }  # => false
```

### any?

```ruby
p [3, 4, 7].any? { |el| el.even? }  # => true
p [3, 5, 7].any? { |el| el.even? }  # => false
```

### none?

```ruby
p [1, 3, 5].none? { |el| el.even? } # => true
p [1, 4, 5].none? { |el| el.even? } # => false
```

### one?

```ruby
p [1, 4, 5].one? { |el| el.even? }  # => true
p [1, 4, 6].one? { |el| el.even? }  # => false
p [1, 3, 5].one? { |el| el.even? }  # => false
```

### count

```ruby
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }             # => 0
```

### sum

```ruby
p [1, -3, 5].sum   # => 3
```

### max and min

```ruby
p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil
```

### flatten

```ruby
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]

p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]
```

## Symbols

```ruby
str = "hello"   # the string
sym = :hello    # the symbol

p str.length    # => 5
p sym.length    # => 5

p str[1]        # => "e"
p sym[1]        # => "e"

p str == sym    # => false
# a string is different from a symbol!
```

### Symbols are Immutable

```ruby
str = "hello"
sym = :hello

str[0] = "x"
sym[0] = "x"

p str   # => "xello"
p sym   # => :hello
```

```ruby
# different locations
"hello".object_id   # => 70233443667980
"hello".object_id   # => 70233443606440
"hello".object_id   # => 70233443438700

# same location
:hello.object_id    # => 2899228
:hello.object_id    # => 2899228
:hello.object_id    # => 2899228
```

### Symbols as hash keys

```ruby
my_bootcamp = { :name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red
```

```ruby
my_bootcamp = { name:"App Academy", color:"red", locations:["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red
```

## Default Arguments and Option Hashes

### Default Arguments

```ruby
# Let's make num an optional parameter.
# By default, num will have the value of 1
def repeat(message, num=1)
    message * num
end

p repeat("hi") # => "hi"
p repeat("hi", 3) # => "hihihi"
```

```ruby
def greet(person_1, person_2=nil)
    if person_2.nil?
        p "Hey " + person_1
    else
        p "Hey " + person_1 + " and " + person_2
    end
end

greet("Chao") # => "Hey Chao"
greet("Chao", "Arittro") # => "Hey Chao and Arittro"
```

### Option Hashes

```ruby
def method(hash)
    p hash  # {"location"=>"SF", "color"=>"red", "size"=>100}
end

method({"location"=>"SF", "color"=>"red", "size"=>100})

# this also works:
method("location"=>"SF", "color"=>"red", "size"=>100)
```

```ruby
def modify_string(str, options)
    str.upcase! if options["upper"]
    p str * options["repeats"]
end

# less readable
modify_string("bye", {"upper"=>true, "repeats"=>3}) # => "BYEBYEBYE"

# more readable
modify_string("bye", "upper"=>true, "repeats"=>3)   # => "BYEBYEBYE"
```

```ruby
def modify_string(str, options={"upper"=>false, "repeats"=>1})
    str.upcase! if options["upper"]
    p str * options["repeats"]
end

modify_string("bye")   # => "bye"
modify_string("bye", "upper"=>true, "repeats"=>3)   # => "BYEBYEBYE"
```

## Splat Operator

### Using splat to accept additional arguments

```ruby
def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end

method("a", "b", "c", "d", "e")
```

```ruby
def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # []
end

method("a", "b")
```

### Using splat to decompose an array

```ruby
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper"
```

```ruby
arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
arr_3 = [ *arr_1, "c", *arr_2 ]
p arr_3 # => ["a", "b", "c", "d", "e"]
```

### Using splat to decompose a hash

```ruby
old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}
```

## Inject

### Inject with only a block

```ruby
[11, 7, 2, 4].inject { |acc, el| acc + el }
```

```ruby
# FIRST ITERATION:
# acc = 11
# el = 7
# new_acc = 18
[11, 7, 2, 4].inject { |acc, el| acc + el }
```

```ruby
# SECOND ITERATION:
# acc = 18
# el = 2
# new_acc = 20
[11, 7, 2, 4].inject { |acc, el| acc + el }
```

```ruby
# acc = 20
# el = 4
# new_acc = 24
p [11, 7, 2, 4].inject { |acc, el| acc + el } # => 24
```

```ruby
p [11, 7, 2, 4].inject { |acc, el| [acc, el].max } # => 2
```

### Inject with a default accumulator

```ruby
[11, 7, 2, 4].inject(100) { |acc, el| acc + el } # => 124
```
