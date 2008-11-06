#!/usr/bin/ruby

module Dofus
  class Recipe
    attr_reader :product, :ingredients

    # ingredients is a hash in the form {"item1", quantity1, "item2", quatity2}
    def initialize(ingredients, product)
      @product = product
      @ingredients = ingredients.clone
    end

    # ingredients required for a batch of given size
    def ingredients_for_batch(size)
      required = {}
      @ingredients.each_pair do |item, quantity|
        required[item] = quantity * size
      end
      required
    end

    # given an inventory, and a list of ingredients with limited supply (no
    # more can be obtained than in the inventory), returns the number of times
    # the recipe can be applied, and products, remaining ingredients, and
    # extra ingredients needed
    # 
    # ingredients: hash of {item => quantity}
    # limited: array of ingredients which have limited supply
    # return value: [iterations, remaining_inventory]
    def batch_from_inventory(inventory, limited)
      remaining = inventory.clone
      remaining.default = 0
      iterations = 0
      raise ArgumentError.new('At least one ingredient must be limited') if
        limited.empty?
      while limited.all? {|item| remaining[item] >= @ingredients[item]}
        @ingredients.each_key {|item| remaining[item] -= @ingredients[item]}
        # remaining[@product] += 1
        iterations += 1
      end
      [iterations, remaining]
    end
  end
end

