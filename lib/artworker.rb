require "artworker/version"
require "artworker/dimensions"
require "artworker/fractions"
require "artworker/titles"
require "artworker/artists"

module Artworker
  
  def uses_artworker_artwork options = {}
    
    default_options ||= {
      :title          => :title,
      :date           => :date,
      :use_fractions  => :use_fractions,
      :use_metric     => :use_metric,
      :dimensions     => { :dimensions => [:height,:width,:depth] }
    }
    
    options = default_options.merge(options)
    
    Artworker::Titles.set_title_functions(options[:title],options[:date])
    Artworker::Dimensions.set_dimensions_functions(options[:dimensions],options[:use_fractions],options[:use_metric])
    
    include Artworker::Dimensions
    include Artworker::Fractions
    include Artworker::Titles
    
  end
  
  def uses_artworker_artist options = {}
    
    default_options ||= {
      :firstname          => :firstname,
      :lastname           => :lastname,
      :birth              => :birth,
      :death              => :death,
      :nationality        => :nationality
    }
    
    options = default_options.merge(options)
    
    Artworker::Artists.set_artist_functions(options[:firstname],options[:lastname],options[:birth],options[:death],options[:nationality])
    
    include Artworker::Artists
    
  end
  
end