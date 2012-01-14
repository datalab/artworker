module Artworker
  module Artwork
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      
      def uses_artworker_artwork(options = {})
        default_options ||= {
          :title          => :title,
          :date           => :date,
          :use_fractions  => :use_fractions,
          :use_metric     => :use_metric,
          :dimensions     => { :dimensions => [:height,:width,:depth] }
        }
        options = default_options.merge(options)
        Artworker::Dimensions.set_dimensions_functions( options[:dimensions],
                                                        options[:use_fractions],
                                                        options[:use_metric])
        include Artworker::Dimensions
        include Artworker::Fractions
        include Artworker::Artwork::InstanceMethods
      end
      
    end
    
    module InstanceMethods
      
      def title_with_date
        if !self.title.blank?
          !self.date.blank? ? "#{self.title}, #{self.date}" : "#{self.title}"
        elsif !self.date.blank?
          "#{self.date}"
        end
      end

      def italic_title_with_date
        if !self.title.blank?
          !self.date.blank? ? "<em>#{self.title}</em>, #{self.date}" : "<em>#{self.title}</em>"
        elsif !self.date.blank?
          "#{self.date}"
        end
      end
      
    end
    
  end
end