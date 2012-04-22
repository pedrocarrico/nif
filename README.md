# Nif - Portuguese NIF generator and validator

[![Build Status](https://secure.travis-ci.org/pedrocarrico/nif.png)](http://travis-ci.org/pedrocarrico/nif)

### Instalation
Just:
	# gem install nif

### How does it work?
	irb> require 'nif'
	=> true
	# generate a nif
	irb> Nif::Generator.generate
	=> "943935784"
	# generate an unique nif (it will not be generated anymore during this session)
	irb> Nif::Generator.generate_unique
	=> "812627318"
	# validate a nif
	irb> Nif::Validator.validate '812627318'
	=> true

### Description

This is a simple project used to learn and teach the basics of ruby syntax, unit testing and code coverage.
It covers the generation and validation of the Portuguese Fiscal Code (or NIF).
If you want to contribute be sure to make a test covering your changes.

Have fun!

### Testing
	# test unit
	rake test
	# rspec
	rake spec
	# cucumber features
	rake cucumber
	# check coverage
	rake rcov # open coverage/index.html for the results

### TODO
Make a CustomValidator for rails.
