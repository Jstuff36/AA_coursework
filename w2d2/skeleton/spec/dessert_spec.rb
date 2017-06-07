require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Cecil") }
  let(:dessert) { Dessert.new("creme brulee", 200, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("creme brulee")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(200)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { dessert.quantity("test") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("sugar")
      expect(dessert.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      test_ingredients = ["heavy cream", "eggs", "vanilla"]
      test_ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end
      dessert.mix!
      expect(dessert.ingredients).not_to eq(test_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(25)
      expect(dessert.quantity).to eq(175)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(10000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Cecil the Great Baker")
      expect(dessert.serve).to eq("Chef Cecil the Great Baker has made 200 creme brulees!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
