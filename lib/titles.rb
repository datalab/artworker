module Artworker
  module Titles
    
    def self.set_title_functions(title,date)
      @@title = "self.#{title}"
      @@date = "self.#{date}"
    end
    
    def title?
      eval @@title
      rescue
    end
    
    def date?
      eval @@date
      rescue
    end
    
    def title_with_date
      if !title?.blank?
        !date?.blank? ? "#{title?}, #{date?}" : "#{title?}"
      elsif !date?.blank?
        "#{date?}"
      end
    end
    
    def italic_title_with_date
      if !title?.blank?
        !date?.blank? ? "<em>#{title?}</em>, #{date?}" : "<em>#{title?}</em>"
      elsif !date?.blank?
        "#{date?}"
      end
    end
    
  end
end