# Nif - Portuguese NIF generator and validator

[![Build Status](https://secure.travis-ci.org/pedrocarrico/nif.png)](http://travis-ci.org/pedrocarrico/nif) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/pedrocarrico/nif)

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
This gem covers the generation and validation of the Portuguese Fiscal Code (or NIF).
I encourage you to contribute but be sure to include a test covering your changes in your pull request.
I've tested it on ruby 1.8.7-p358, 1.9.3-p125 and rails 3.2.3.

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

### Rails Custom Validator
To have this included as a rails custom validator you have to include it on your model like this:

	class Person < ActiveRecord::Base
	  include Nif
	
	  validates :nif, :nif=> true
	end
	

nif comes with it's own I18n file but you can also define the :invalid key in your locale to have a custom message in your models like this:

	en:
	  activerecord:
	    errors:
	      models:
	        person:
	          attributes:
	            nif:
	              invalid: 'is not valid!'

### TODO
Have javascript validations available.
