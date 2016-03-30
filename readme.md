= Notes

Stored here (so I can work on it from multiple machines)
http://github.com/apdunston/gilded-rose.git

I've left Item and GildedRose classes with their original APIs. That wasn't explicit in the instructions, but if I were adding to an existing system, I wouldn't want to change how it presented to the outside world. Technically, I could have subclassed Item and done some clever things with the initialize path so Item.new would still work, but I find that getting too clever makes it hard to maintain code. So I went with a decorator pattern instead. I think it's lovely.

== References

http://stackoverflow.com/questions/9017158/running-ruby-unit-tests-with-rake
Rakefile syntax

http://ruby-doc.org/stdlib-2.0.0/libdoc/test/unit/rdoc/Test/Unit/Assertions.html
Test::Unit assertions

http://stackoverflow.com/questions/13767240/ruby-how-to-make-a-public-static-method
Forgot how to phrase static methods in Ruby.

http://stackoverflow.com/questions/948135/how-can-i-write-a-switch-statement-in-ruby
Switch statements in Ruby

== Possible error

* Backstage passes are currently coded to exceed 50 though the instructions say they shouldn't. This is a clear violation because Sulfuras is called out as being an exception, but passes aren't. I'm going to treat this as a bug and fix it.
* Brie increases by 2 per day after its days go to 0. I would have expected it to increase by 1, and the code is a bit convoluted. But it's unclear, so I'll treat it as a feature, not a bug.
