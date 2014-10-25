totp-cli
========

totp-cli is a simple cli application (duh!) to generate OTP tokens for two
factor authentication using [RFC6238](http://tools.ietf.org/html/rfc6238).

These are compatible with stuff like github, google services, etc.

totp-cli fetches your shared key (aka: code) from
[pass](http://www.passwordstore.org/), generates the token, outputs it to
stdout and copies it to your PRIMARY X selection.

Shared keys should be stored in your pass storage under ```2fa/SERVICE/code```,
for example ```2fa/github/code```.

Usage
-----

    totp SERVICE

For example:

    $ totp github
    621787


Requirements
------------

 * [pass](http://www.passwordstore.org/)
 * [xclip](http://sourceforge.net/projects/xclip)
 * [ruby](https://www.ruby-lang.org/)


Installation
------------

    $ sudo make install

License
-------

totp-cli is distrbuted under the terms of the MIT license. See LICENSE for
details.

Copyright (c) 2014 Hugo Osvaldo Barrera <hugo@barrera.io>
