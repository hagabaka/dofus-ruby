#!/usr/bin/ruby

require 'highline'
require 'dofus/recipes'

def format_inventory(inventory)
  inventory.map do |item, quantity|
    "#{quantity} #{item.name}"
  end.join(', ')
end

RECIPE_HASH = {}
def format_recipe(recipe)
  RECIPE_HASH[recipe] ||=
    "#{recipe.product.name} = #{format_inventory(recipe.ingredients)}"
end

def unformat_recipe(format)
  RECIPE_HASH.index(format)
end

def show_inventory
  H.say "Inventory:\n#{format_inventory(@inventory)}"
end


H = HighLine.new
ITEM_HASH = {}
Dofus::ITEMS.each {|item| ITEM_HASH[item.name] = item}
ITEM_NAMES = ITEM_HASH.keys
ITEM_LIST = H.list(ITEM_NAMES, :columns_down)
RECIPE_LIST = H.list(Dofus::RECIPES.map {|recipe| format_recipe(recipe)})

@inventory = Hash.new(0)

# Return to main menu when Ctrl-C is pressed
trap('SIGINT') do
  H.say "(Cancelled)"
  throw :return
end

H.say 'Welcome to Dofus Recipe Calculator. Press Tab at prompts to auto-complete choices. Press Ctrl-C to return to the main menu at any time.'

loop do
  catch(:return) do
    H.say "-----\n\n"
    H.choose do |main_menu|
      main_menu.header = 'Choose an action'
      main_menu.readline = true

      main_menu.choice('Edit inventory') do
        loop do
          show_inventory

          chosen_item = H.choose do |item_menu|
            item_menu.readline = true
            item_menu.header = 'Enter an item'
            item_menu.select_by = :name
            ITEM_NAMES.each {|name| item_menu.hidden name}
          end
          quantity = H.ask('Enter amount to increase/decrease: ', Integer)
          @inventory[ITEM_HASH[chosen_item]] += quantity
        end
      end

      main_menu.choice('Batch craft') do
        loop do
          interesting_recipes = Dofus::RECIPES.select do |recipe|
            @inventory.any? do |(item, quantity)|
              recipe.ingredients.include?(item) &&
              quantity >= recipe.ingredients[item]
            end
          end

          if interesting_recipes.empty?
            H.say 'No recipe can be used with current inventory'
            show_inventory
            throw :return
          end

          @current_recipes = interesting_recipes.map {|r| format_recipe(r)}
          chosen_recipe = H.choose do |recipe_menu|
            recipe_menu.readline = true
            recipe_menu.header = 'Possible recipes with current inventory'
            @current_recipes.each {|recipe| recipe_menu.choice(recipe)}
          end

          recipe = unformat_recipe(chosen_recipe)
          limited = []
          loop do
            limited = recipe.ingredients.reject do |(ingredient, quantity)|
              @inventory[ingredient] <= quantity ||
              H.agree("Will you buy more of #{ingredient.name} for this batch? ")
            end.keys

            if limited.empty?
              H.say 'You must answer no for at least one of the ingredients!'
            else
              break
            end
          end

          (iterations, @inventory) = 
            recipe.batch_from_inventory(@inventory, limited)

          H.say "Recipe performed #{iterations} times."
          show_inventory
        end
      end

      main_menu.choice('List items') do
        H.say ITEM_LIST
      end

      main_menu.choice('List recipes') do
        H.say RECIPE_LIST
      end

      main_menu.choice('Quit') do
        exit
      end
    end
  end
end
