require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:new_product) { Product.create(name: "Test Pro", price: 55, stock: 55, description: "manythings") }
  let(:all_pro) { Product.all }

  describe "index should list all products" do
    get products_path
    response.
    it 'should show all products' do

    end
  end


end
