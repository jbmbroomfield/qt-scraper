class CreateQts < ActiveRecord::Migration[5.2]
    def change
        create_table :qts do |t|
            t.string :url
            t.string :title
        end
    end
end