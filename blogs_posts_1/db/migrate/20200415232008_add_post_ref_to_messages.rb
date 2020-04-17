class AddPostRefToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :post, index: true, foreign_key: true
  end
end
