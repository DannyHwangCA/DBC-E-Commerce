require 'rails_helper'

RSpec.describe Product, type: :model do

  it "has one more after adding one" do
    current_count = Product.all.count
    new_product = Product.create(name: "Test Pro", price: 55, stock: 55, description: "manythings")
    expect(Product.all.count).to eq(current_count + 1)
  end

  describe "validation test" do
    describe "name validation test" do
      it "should be present" do
        new_product = Product.new(price: 55, stock: 55, description: "manythings")
        expect(new_product.valid?).to be_falsy
      end

      it "should have more than 5 characters on name" do
        new_product = Product.new(name: "i" * 4, price: 55, stock: 55, description: "manythings")
        expect(new_product.valid?).to be_falsy
      end

      it "should be valid with valid input" do
        new_product = Product.new(name: "i" * 5, price: 55, stock: 55, description: "manythings")
        expect(new_product.valid?).to be_truthy
      end
    end

    describe "description validation test" do
      it "should be present" do
        new_product = Product.new(name: "i" * 5, price: 55, stock: 55)
        expect(new_product.valid?).to be_falsy
      end

      it "should have no more than 2500 characters" do
        new_product = Product.new(name: "ijfsakjfha", price: 55, stock: 55, description: "I" * 2501)
        expect(new_product.valid?).to be_falsy
      end

      it "should be valid with valid input" do
        new_product = Product.new(name: "i" * 5, price: 55, stock: 55, description: "I" * 2499)
        expect(new_product.valid?).to be_truthy
      end
    end

    describe "price validation test" do
      it "should be present" do
        new_product = Product.new(name: "i" * 5, stock: 55, description: "I" * 2499)
        expect(new_product.valid?).to be_falsy
      end

      it "should be invalid if not positive number" do
        new_product = Product.new(name: "ijfsakjfha", price:-1, stock: 55, description: "I" * 5)
        expect(new_product.valid?).to be_falsy
      end

      it "should be valid with valid input" do
        new_product = Product.new(name: "i" * 5, price: 55, stock: 55, description: "I" *5)
        expect(new_product.valid?).to be_truthy
      end
    end

    describe "Stock validation test" do
      it "should be present" do
        new_product = Product.new(name: "i" * 5, price: 55, description: "I" * 5)
        expect(new_product.valid?).to be_falsy
      end

      it "should be positive" do
        new_product = Product.new(name: "ijfsakjfha", price:55, stock: -1, description: "I" * 5)
        expect(new_product.valid?).to be_falsy
      end

      it "should be valid with valid input" do
        new_product = Product.new(name: "i" * 5, price: 55, stock: 55, description: "I" * 5)
        expect(new_product.valid?).to be_truthy
      end
    end

  end


end
