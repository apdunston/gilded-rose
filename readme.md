= Notes

Stored here (so I can work on it from multiple machines)
http://github.com/apdunston/gilded-rose.git

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
