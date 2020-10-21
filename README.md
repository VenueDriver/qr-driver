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

# Usage

### Generate a QR code in PNG format

(SVG is the default.)

    $ ruby qrdriver.rb generate "https://example.com/qr" --format png

### Generate a QR code into a different output Folder

    $ ruby qrdriver.rb generate "https://example.com/qr" --output-folder ~/Desktop/

### Generate a QR code and specify the filename

If you want to set the folder, then set it in the filename.

    $ ruby qrdriver.rb generate "https://example.com/qr" --output-filename qr.svg

    $ ruby qrdriver.rb generate "https://example.com/qr" --output-filename ~/Desktop/qr.svg

### Don't open the QR code after generating it

    $ ruby qrdriver.rb generate "https://example.com/qr" --no-open
