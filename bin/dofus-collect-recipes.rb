#!/usr/bin/ruby

# Collect recipes and items from paste of wikia page and generate recipes.rb
# file
#
# Provide the name of input file in argument or pipe it
#
# Format of input file:
# One recipe per line
# Example line:
# Product Item  2 Ingredient A, 3 Ingredient B, 1 Ingredient C
# (Two or more spaces between product and the ingredient list)
#
# Example input files are in doc/examples

require 'dofus/recipe'
require 'dofus/item'
require 'yaml'

ITEMS = {}
RECIPES = []

def add_item(name)
  ITEMS[name] ||= Dofus::Item.new(name, {})
end

ARGF.each_line do |line|
  line.strip
  (product_name, ingredient_list) = line.strip.split(/\s{2,}/)
  next unless product_name && ingredient_list
  product = add_item(product_name)
  ingredients = {}
  ingredient_list.split(', ').each do |ingredient|
    if ingredient =~ /([1-9]\d*) (.+)/
      (quantity, item_name) = Integer($1), $2
      item = add_item(item_name) 
      ingredients[item] = quantity
    else
      warn "Cannot parse #{ingredient}"
    end
  end
  RECIPES << Dofus::Recipe.new(ingredients, product)
end

$stdout.write <<EOS
require 'dofus/item'
require 'dofus/recipe'
require 'yaml'

module Dofus

  RECIPE_DATA = <<-END_RECIPE_DATA
#{{'items' => ITEMS.values, 'recipes' => RECIPES}.to_yaml}
  END_RECIPE_DATA

  ITEMS, RECIPES = YAML.load(RECIPE_DATA).values_at('items', 'recipes')
end
EOS

