Hanami::Model.migration do
  change do
    create_table :speakers do
      primary_key :id
      column :name, String, null: false
      column :twitter, String
      column :talk, String, null: false
    end
  end
end
