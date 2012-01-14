class ArtworkModels < ActiveRecord::Base
  uses_artworker_artwork :dimensions => { :dimensions => [:height, :width, :depth], 
                                          :framed_dimensions => [:framed_height, :framed_width, :framed_depth]}
end

class ArtistModels < ActiveRecord::Base
  uses_artworker_artist
end