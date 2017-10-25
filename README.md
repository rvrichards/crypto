# one_time.rb


This is a one-time pad algorithm. It is currently very basic, only allowing alphabetic characters and stripping out all other one. Converts lowercase to uppercase too.
Improvements
* allow to toggle upper/lower case
* allow spaces
* store key as instance variable? may defeat security by allowing reusing key
* make it command line friendly
There is example code to see it in action at bottomof the file.

# crypto.rb

This will be a class to hold tools to help with crypto, my first guess is to mixin to the String class. It will use conversion to hex and XOR functions.


# vig.rb

This is a implementation of the Vigenere cipher. Basically two methods
* encode(key, plaintext)
* decode(key, cipher)
The **key** is a repeating one, unless you provide one the length of the plaintext. Of form: **AAA...**
