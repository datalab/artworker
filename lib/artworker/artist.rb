module Artworker
  module Artist
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      
      def uses_artworker_artist(options = {})
        default_options ||= {
          :firstname          => :firstname,
          :lastname           => :lastname,
          :birth              => :birth,
          :death              => :death,
          :nationality        => :nationality
        }
        options = default_options.merge(options)
        include Artworker::Artist::InstanceMethods
        # options = default_options.merge(options)
        # 
        # Artworker::Artists.set_artist_functions(  options[:firstname],
        #                                           options[:lastname],
        #                                           options[:birth],
        #                                           options[:death],
        #                                           options[:nationality])
        # 
        # include Artworker::Artists
      end
      
    end
    
    module InstanceMethods
      
      def fullname
        "#{self.firstname} #{self.lastname}".strip
      end
      
      def dates
        if !self.birth.blank?
          if !self.death.blank?
            "#{self.birth} - #{self.death}"
          else
            "b. #{self.birth}"
          end
        elsif !self.death.blank?
          "d. #{self.death}"
        end
      end
      
      def fullname_with_dates
        if !fullname.blank?
          if !dates.blank?
            "#{fullname} (#{dates})"
          else
            "#{fullname}"
          end
        elsif !dates.blank?
          "#{dates}"
        end
      end
      
      def fullname_with_nationality_and_dates
        if !fullname.blank?
          if !self.nationality.blank?
            if !dates.blank?
              "#{fullname} (#{self.nationality}, #{dates})"
            else
              "#{fullname} (#{self.nationality})"
            end
          else
            "#{fullname_with_dates}"
          end
        elsif !self.nationality.blank?
          if !dates.blank?
            "#{self.nationality}, #{dates}"
          else
            "#{self.nationality}"
          end
        end
      end
      
    end
  end
end