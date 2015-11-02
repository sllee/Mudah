class CreateProductsCategories < ActiveRecord::Migration
	def change
		craete_table :products_categories do |t|
			t.belongs_to :product
			t.belongs_to :category
			t.timestamps null: false
		end
	end
end
