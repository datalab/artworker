ActiveRecord::Schema.define :version => 0 do
  create_table "artist_models", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "birth"
    t.string   "death"
    t.string   "nationality"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "artwork_models", :force => true do |t|
    t.string   "title"
    t.string   "date"
    t.decimal  "height",        :default => 0.0,   :null => false
    t.decimal  "width",         :default => 0.0,   :null => false
    t.decimal  "depth",         :default => 0.0,   :null => false
    t.decimal  "framed_height", :default => 0.0,   :null => false
    t.decimal  "framed_width",  :default => 0.0,   :null => false
    t.decimal  "framed_depth",  :default => 0.0,   :null => false
    t.boolean  "use_fractions", :default => true,  :null => false
    t.boolean  "use_metric",    :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end
end