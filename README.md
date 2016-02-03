totp-cli
========

totp-cli is a simple command line application to generate OTP tokens for two
factor authentication using [RFC6238](http://tools.ietf.org/html/rfc6238).  

These are compatible with many popular services such as facebook, github,
google, eve-online, etc.

totp-cli fetches your shared key (aka: code) from [pass][pass], generates the
token, outputs it to stdout and copies it to your PRIMARY X selection.

Shared keys should be stored in your pass storage under `2fa/SERVICE/code`,
for example `2fa/github/code`.

[pass]: http://www.passwordstore.org/

Usage
-----

    totp SERVICE

For example:

    $ totp github
    621787

You don't need to run `totp` from the command line if you just want to paste
the code; you can run if from `dmenu`, or whatever your application launcher
is.

To add new services, simply add their code to your pass store:

    $ pass insert 2fa/some_service/code

Requirements
------------

 * [pass](http://www.passwordstore.org/)
 * [xclip](http://sourceforge.net/projects/xclip)
 * [ruby](https://www.ruby-lang.org/)


Installation
------------

    $ sudo make install
    $ sudo gem install rotp

License
-------

totp-cli is distrbuted under the terms of the MIT license. See LICENSE for
details.

Copyright (c) 2014-2016 Hugo Osvaldo Barrera <hugo@barrera.io>
