class CreatePosts < ActiveRecord::Migration[5.2]
    def change
        create_table :posts do |t|
            t.integer :qt_id
            t.string :user
            t.integer :number
            t.string :date
            t.string :time
            t.string :text
            t.string :note
        end
    end
end