module Artworker
  module Artists
    
    def self.set_artist_functions(firstname,lastname,birth,death,nationality)
      @@firstname = "self.#{firstname}"
      @@lastname = "self.#{lastname}"
      @@birth = "self.#{birth}"
      @@death = "self.#{death}"
      @@nationality = "self.#{nationality}"
    end
    
    def firstname?
      eval @@firstname
      rescue
    end
    
    def lastname?
      eval @@lastname
      rescue
    end
    
    def birth?
      eval @@birth
      rescue
    end
    
    def death?
      eval @@death
      rescue
    end
    
    def nationality?
      eval @@nationality
      rescue
    end
    
    def fullname
      "#{firstname?} #{lastname?}".strip
    end
    
    def dates
      if !birth?.blank?
        if !death?.blank?
          "#{birth?} - #{death?}"
        else
          "b. #{birth?}"
        end
      elsif !death?.blank?
        "d. #{death?}"
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
        if !nationality?.blank?
          if !dates.blank?
            "#{fullname} (#{nationality?}, #{dates})"
          else
            "#{fullname} (#{nationality?})"
          end
        else
          "#{fullname_with_dates}"
        end
      elsif !nationality?.blank?
        if !dates.blank?
          "#{nationality?}, #{dates}"
        else
          "#{nationality?}"
        end
      end
    end
    
  end
end