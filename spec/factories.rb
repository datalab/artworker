include ActionDispatch::TestProcess

Factory.define :artist_models do |f|
  f.firstname "Sample"
  f.lastname "Artist"
  f.birth "1900"
  f.death "2000"
  f.nationality "American"
end

Factory.define :artwork_models do |f|
  f.title "Sample Artwork"
  f.date "2012"
  f.height "24"
  f.width "24"
  f.depth "24"
  f.framed_height "26"
  f.framed_width "26"
  f.framed_depth "26"
  f.use_fractions true
  f.use_metric false
end