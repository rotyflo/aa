# Software Engineering Foundations

**Advanced Ruby**
* [Becoming a Rubyist](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/becoming-a-rubyist-notes)
    * Implicit Returns
    * Omitting parentheses for method calls with no arguments
    * Use single line conditionals when possible
    * Use built-in methods
    * Use enumerables to iterate
* [Common Enumerables](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/common-enumerables-notes)
    * all?
    * any?
    * none?
    * one?
    * count
    * sum
    * max and min
    * flatten
* [Symbols](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/symbols-notes)
    * Symbols are Immutable
    * Symbols as hash keys
* [Default Arguments and Option Hashes](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/default-arguments-and-option-hashes-notes)
    * Default Arguments
    * Option Hashes
* [Splat Operator](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/splat-operator-notes)
    * Using splat to accept additional arguments
    * Using splat to decompose an array
    * Using splat to decompose a hash
* [Inject](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/inject-notes)
    * Inject with only a block
    * Inject with a default accumulator

**Scope and References**
* [Bubble Sort](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/bubble-sort-notes)
    * How does a pass of Bubble Sort work?
    * How do we know when we are done Bubble Sorting?
    * Swapping Elements
    * Bubble Sort Ruby Implementation
* [Scope](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/scope-notes)
    * Methods and Local Scope
    * Global Variables
    * Constants
    * What does not have it's own scope?
* [Variable References I](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/variable-references-lecture-1)
    * How to modify variable without changing object_id
* [Variable References II](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/variable-references-lecture-2)
    * Create 3D arrays with `Array.new(3) { Array.new(3) }`

**RSpec**
* [Intro to Testing](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/intro-to-testing-notes)
    * What is TDD?
    * TDD workflow with `prime?`
    * When Should We Use TDD?
* [RSpec](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/rspec-notes)
    * Why do we use automated testing?
    * What is automated testing?
    * Foundations and testing
    * Anatomy of an RSpec project
    * How to Read Specs
* [Exceptions](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/exceptions-notes)
    * Handling Exceptions
    * Raising Exceptions
    * Bring it all together

**Debugging**
* [Pry](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/pry-notes)
    * Debugging using Pry
    * Installing Pry
    * Using Pry
    * `ls`
    * `show-doc`
    * `load`
    * `show-source`
* [Byebug](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/bye-bug-notes)
    * Byebug Cheatsheet
    * Running Byebug
    * `display`
    * `next`
    * `step`
    * `break` and `continue`
* [Common Error Types](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/common-error-types-notes)
    * Reading an Error Message
    * SyntaxError
    * NameError
    * NoMethodError
    * ArgumentError
    * TypeError

**Blocks & Procs**
* [Blocks](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/blocks-notes)
    * Block Basics
    * Using Methods as Blocks
* [Procs](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/procs-notes)
    * Creating a Proc
    * Calling a Proc
    * Passing a Proc to a Method
    * Using `&`

**Classes**
* [Class Basics](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/class-basics-notes)
    * Creating a Cat Class
    * Initializing New Cats
    * Getter Methods
    * Setter Methods
* [Instance vs Class Variables](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/instance-vs-class-variables-notes)
    * Instance Variables
    * Class Variables
    * Class Constants
* [Instance vs Class Methods](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/instance-vs-class-methods-notes)
    * Instance Methods
    * Class Methods

**Class Monkey Patching**
* [Monkey Patching](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/monkey-patching-lecture)
    * What is Monkey Patching?
    * Add methods to `String`
    * Add methods to `Integer`
    * Add methods to `Array`

**Input / Ouput**
* [Requiring Files](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/requiring-files-notes)
    * Seperation of Concerns
    * Import files with `require_relative`
    * `require` vs `require_relative`
* [User Input](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/user-input-notes)
    * Getting Input - `gets`
    * Dealing with New Lines - `chomp`
    * Getting Numbers - `to_i`

**Object Oriented Programming**
* [Abstraction and Encapsulation](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/abstraction-and-encapsulation-notes)
    * Abstraction - making the complex simple
    * Encapsulation - managing what the user can see/modify
* [Attr methods](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/attr-methods-notes)
    * `attr_reader` - getters
    * `attr_writer` - setters
    * `attr_accessor` - both
* [Syntactic Sugar](https://open.appacademy.io/learn/full-stack-online/software-engineering-foundations/syntactic-sugar-notes)
    * Implementing Operator Methods - `#>`, `#==`, `#+`, etc
    * Implementing Bracket Methods - `#[]`
    * Implementing `#[]=`