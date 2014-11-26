class AddImagesAssociationToStreams < ActiveRecord::Migration
  def change
  	add_index 'images',['stream_id'], :name => 'index_stream_id'
  end
end
