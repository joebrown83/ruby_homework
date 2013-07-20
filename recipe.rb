#!/usr/bin/ruby
require 'httparty'

class Recipe
  include HTTParty

  base_uri 'www.recipepuppy.com'
  default_params output: "json", onlyImages: 1
  format :json

  def self.for(text)
    get("/api", :query => {:q => text})["results"]
  end
end

puts Recipe.for "chocolate"
puts Recipe.for "apple pie"
