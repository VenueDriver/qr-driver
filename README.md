# QR Driver

Sometimes you want some free web site to generate an image quickly for you.  And sometimes you want something that you can script and maybe run in the cloud.

# Install

* You need Ruby 2.7.  You might want [RVM](https://rvm.io/)
* Clone this project
* `bundle install`

# Run

    $ ruby qrdriver.rb
    Commands:
    qrdriver.rb generate URL    # Generate a QR code that goes to URL.
    qrdriver.rb help [COMMAND]  # Describe available commands or one specific command

    $ ruby qrdriver.rb generate "https://google.com"
