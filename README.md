# Ruby on Rails Tutorial sample application

This is the sample application for the
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](https://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems. You can clone the repo as follows:

```
$ git clone https://github.com/learnenough/rails_tutorial_sample_app_7th_ed 
$ cd rails_tutorial_sample_app_7th_ed/
```

To install the gems, you will need the same version of Bundler used to build the sample app, which you can find using the `tail` command as follows:

```
$ tail -n1 Gemfile.lock
   <version number>
```

Next, install the same version of the `bundler` gem and install the gems accordingly:

```
$ gem install bundler -v <version number>
$ bundle _<version number>_ config set --local without 'production'
$ bundle _<version number>_ install
```

Here you should replace `<version number>` with the actual version number. For example, if `<version number>` is `2.3.11`, then the commands should look like this:

```
$ gem install bundler -v 2.3.11
$ bundle _2.3.11_ config set --local without 'production'
$ bundle _2.3.11_ install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you’ll be ready to seed the database with sample users and run the app in a local server:

```
$ rails db:seed
$ rails server
```

Follow the instructions in [Section 1.2.2 `rails server`](https://www.railstutorial.org/book#sec-rails_server) to view the app. You can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org` and password `foobar`.

## Deploying

To deploy the sample app to production, you’ll need a Heroku account as discussed [Section 1.4 Deploying](https://www.railstutorial.org/book/beginning#sec-deploying).

The full production app includes several advanced features, including sending email with [SendGrid](https://sendgrid.com/) and storing uploaded images with [AWS S3](https://aws.amazon.com/s3/). As a result, deploying the full sample app can be rather challenging. The suggested method for testing a deployment is to use the branch for Chapter 10 (“Updating users”), which doesn’t require more advanced settings but still includes sample users.

To deploy this version of the app, you’ll need to create a new Heroku application, switch to the right branch, push up the source, run the migrations, and seed the database with sample users:

```
$ heroku create
$ git checkout updating-users
$ git push heroku updating-users:main
$ heroku run rails db:migrate
$ heroku run rails db:seed
```

Visiting the URL returned by the original `heroku create` should now show you the sample app running in production. As with the local version, you can then register a new user or log in as the sample administrative user with the email `example@railstutorial.org` and password `foobar`.

## Branches

The reference app repository includes a separate branch for each chapter in the tutorial (Chapters 3–14). To examine the code as it appears at the end of a particular chapter (with some slight variations, such as occasional exercise answers), simply check out the corresponding branch using `git checkout`:

```
$ git checkout <branch name>
```

A full list of branch names appears as follows (preceded the number of the corresponding chapter in the book):

```
 3. static-pages
 4. rails-flavored-ruby
 5. filling-in-layout
 6. modeling-users
 7. sign-up
 8. basic-login
 9. advanced-login
10. updating-users
11. account-activation
12. password-reset
13. user-microposts
14. following-users
```

For example, to check out the branch for Chapter 7, you would run this at the command line:

```
$ git checkout sign-up
```

## Help with the Rails Tutoiral

Experience shows that comparing code with the reference app is often helpful for debugging errors and tracking down discrepancies. For additional assistance with any issues in the tutorial, please consult the [Rails Tutorial Help page](https://www.railstutorial.org/help).

Suspected errors, typos, and bugs can be emailed to <support@learnenough.com>. All such reports are gratefully received, but please double-check with the [online version of the tutorial](https://www.railstutorial.org/book) and this reference app before submitting.

## Rails flavored Ruby
```ruby
$ rails console
Loading development environment (Rails 7.0.4)
>> 17 + 22
=> 39

# Strings and methods
>> ""
=> ""
>> "foo"
=> "foo"
>> "foo" + "var"
=> "foovar"
>> first_name = "john"
=> "john"
>> "#{first_name} hello"
=> "john hello"
>> puts "foo"
foo
=> nil
>> print "foo"
foo=> nil
>> 'foo'
=> "foo"
>> '#{first_name} hello'
=> "\#{first_name} hello"
>> 'Newlines (\n) and tabs (\t) both use the backslash character \.'
=> "Newlines (\\n) and tabs (\\t) both use the backslash character \\."
>> "Newlines (\n) and tabs (\t) both use the backslash character \."
=> "Newlines (\n) and tabs (\t) both use the backslash character ."
>> print "Newlines (\n) and tabs (\t) both use the backslash character \."
Newlines (
) and tabs (    ) both use the backslash character .=> nil
>> print 'Newlines (\n) and tabs (\t) both use the backslash character \.'
Newlines (\n) and tabs (\t) both use the backslash character \.=> nil
>> "foobar".length
=> 6

>> if s.nil?
>> "The variable is nil"
>> elsif s.empty?
>> "The string is empty"
>> elsif s.include?("foo")
>> "The string includes 'foo'" >> end
=> "The string includes 'foo'"

>> puts "one empty and one nil" if "".empty? && nil.nil?
one empty and one nil

>> "s" == "s"
=> true

# methods
# 1. default returns 2. default argument value
?> def string_message(str = '')
?>   if str.empty?
?>     "It's am empty string!"
?>   else
?>     "The string is nonempty"
?>   end
>> end
=> :string_message
# equivalent to
>> def string_message(str = '')
>>    return "It's an empty string!" if str.empty?
>>    return "The string is nonempty."
>> end
=> :string_message

# run the method
>> puts string_message("foobar")
The string is nonempty
=> nil
>> puts string_message("")
It's am empty string!
=> nil
>> puts string_message
It's am empty string!
=> nil

# Data structures

## array
>> a
=> [42, 8, 17]
>> a.first
=> 42
>> a.second
=> 8
>> a.last
=> 17
>> a.last == a[-1] => true

# no mutation
>> a
=> [42, 8, 17]
>> a.empty?
=> false
>> a.include?(42) => true
>> a.sort
=> [8, 17, 42]
>> a.reverse
=> [17, 8, 42]
>> a.shuffle
=> [17, 42, 8]
>> a
=> [42, 8, 17]

# use "bang" methods to mutate the original array
>> a
=> [42, 8, 17] >> a.sort!
=> [8, 17, 42] >> a
=> [8, 17, 42]

# add element
>> a.push 6
=> [8, 17, 42, 6]
>> a.push -1
=> [8, 17, 42, 6, -1]
>> a << 12
=> [8, 17, 42, 6, -1, 12]
>> a << 100 << 121
=> [8, 17, 42, 6, -1, 12, 100, 121]

>> a.join(",")
=> "8,17,42,6,-1,12,100,121"

>> a
=> ["foo", "bar", "baz", "quux"]
>> a[-1]
=> "quux"
>> a[1..-1]
=> ["bar", "baz", "quux"]


# range
>> range = 0..9
=> 0..9
0..9.to_a
# (irb):131:in `<main>': undefined method `to_a' for 9:Integer (NoMethodError)
>> range.to_a
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# short form to create an array of string without `"` and `,`
>> a = %w[foo bar baz quux]
=> ["foo", "bar", "baz", "quux"]


# Blocks
>> (1..5).each { |i| puts 2 * i }
2
4
6
8
10
=> 1..5
?> (1..5).each do |i|
?>   puts 2 * i
>> end
2
4
6
8
10

?> 3.times do |i|
>> puts i end
0
1
2

>> (1..5).map { |i| i**2 }
=> [1, 4, 9, 16, 25]

>> %w[a b c].map { |char| char.upcase }
=> ["A", "B", "C"]
# equivalent
>> %w[A B C].map(&:downcase)
=> ["a", "b", "c"]


# Hashes(dictionary)
>> user = { "first_name" => "Michael", "last_name" => "Hartl" }
=> {"first_name"=>"Michael", "last_name"=>"Hartl"}
>> user
=> {"first_name"=>"Michael", "last_name"=>"Hartl"}
>> user["id"] = 1
=> 1
>> user
=> {"first_name"=>"Michael", "last_name"=>"Hartl", "id"=>1}
>> user["id"]
=> 1
>> user["saas"]
=> nil

>> user[:email] = "abc@gmail.com"
=> "abc@gmail.com"
>> user[:email]
=> "abc@gmail.com"

## Not all characters are valid for symbols
>> :foo-bar
# undefined local variable or method `bar' for main:Object (NameError) 
>> :2foo
# SyntaxError

# symbols as keys for hashes
>> h1 = { :name => "Michael Hartl", :email => "michael@example.com" }
=> {:name=>"Michael Hartl", :email=>"michael@example.com"}
>> h2 = { name: "Michael Hartl", email: "michael@example.com" }
=> {:name=>"Michael Hartl", :email=>"michael@example.com"}
>> h1 == h2
=> true
>> h2[name]
# (irb):218:in `<main>': undefined local variable or method `name' for main:Object (NameError)

#h2[name]
#   ^^^^
>> h2[:name]
=> "Michael Hartl"

>> flash = { success: "It worked!", danger: "It failed." }
=> {:success=>"It worked!", :danger=>"It failed."}

?> flash.each do |key, value|
?>   puts "Key #{key.inspect} has value #{value.inspect}"
>> end
Key :success has value "It worked!"
Key :danger has value "It failed."
=> {:success=>"It worked!", :danger=>"It failed."}

>> h = {foo: 0, bar: 1, baz: 2}
>>   h1 = {bat: 3, bar: 4}
>>   h2 = {bam: 5, bat:6}
>>   h.merge!(h1, h2)
=> {:foo=>0, :bar=>4, :baz=>2, :bat=>6, :bam=>5}


# syntactic sugar
## () can be omitted, if hash is the last argument {} can be omitted
stylesheet_link_tag "application", "data-turbo-track": "reload"
# equivalent to
stylesheet_link_tag("application", { "data-turbo-track": "reload" })


# Classes
## built-in
>> s = String.new("foobar")
=> "foobar"
>> a = Array.new([1,2,3])
=> [1, 2, 3]
>> h = Hash.new
=> {}
# String < Object < BasicObject
>> s.class
=> String
>> s.class.superclass
=> Object
>> s.class.superclass.superclass
=> BasicObject
>> s.class.superclass.superclass.superclass
=> nil

# inheritance
>> class Word < String # Word inherits from String.
>> # Returns true if the string is its own reverse.
>>    def palindrome?
>>       self == self.reverse # self is the string itself.
>>    end
>> end => nil

>> s = Word.new("level") 
=> "level"
>> s.palindrome?
=> true
>> s.length => 5

class User
   # “getter” and “setter” for @name and @email instance variables
   attr_accessor :name, :email
   
   # constructor
   def initialize(attributes = {})
      # instance variables starts with @ and in the context of rail is available in view
      @name = attributes[:name]
      @email = attributes[:email]
   end
   
   def formatted_email
      "#{@name} <#{@email}>"
   end
end

>> u = User.new name: 'John', email: "test@gmail.com"
=> #<User:0x000000010c287d20 @email="test@gmail.com", @name="John">
>> u.name
=> "John"
>> u.email
=> "test@gmail.com"
>> u.formatted_email
=> "John <test@gmail.com>"
```