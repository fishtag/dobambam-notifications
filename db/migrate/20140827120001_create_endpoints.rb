class CreateEndpoints < ActiveRecord::Migration
  def change
    create_table :endpoints, id: :uuid do |t|
      t.belongs_to :user
      t.string :repost_url

      t.timestamps
    end
  end
end
