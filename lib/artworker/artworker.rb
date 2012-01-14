require "active_record/railtie"
require "active_support/core_ext"

module Artworker
  class Railtie < Rails::Railtie
    if defined?(ActiveRecord::Base)
      ActiveRecord::Base.send :include, Artworker::Artist
      ActiveRecord::Base.send :include, Artworker::Artwork
    end
  end
end