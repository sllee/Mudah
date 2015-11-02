class CreateFavourites < ActiveRecord::Migration
	def change
		create_table :favourites do |t|
			t.string :product
			t.belongs_to :user
			t.timestamps null: false
		end
	end
end
