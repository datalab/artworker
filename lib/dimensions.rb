module Artworker
  module Dimensions
    
    def self.set_dimensions_functions(dimensions, use_fractions, use_metric)
      @@use_fractions = "self.#{use_fractions}"
      @@use_metric = "self.#{use_metric}"

      format_total_dimensions(dimensions)
      format_individual_dimensions(dimensions)
    end
    
    def self.format_individual_dimensions(dimensions)
      dimensions.each do |dimension_collection|
        dimension_collection[1].each do |dimension|

          define_method "#{dimension}" do
            Artworker::Dimensions.read_dimension(read_attribute(dimension),fractions?) unless read_attribute(dimension).nil?
          end

          define_method "#{dimension}_in_centimeters" do
            if read_attribute(dimension) && read_attribute(dimension) > 0
              metric? ? eval("self.#{dimension.to_s}") : convert_to_centimeters(eval("self.#{dimension.to_s}"))
            end
          end

          define_method "#{dimension}_in_inches" do
            if read_attribute(dimension) && read_attribute(dimension) > 0
              metric? ? Artworker::Fractions.round_to_nearest_fraction(convert_to_inches(eval("self.#{dimension.to_s}")).to_s, "1/16") : eval("self.#{dimension.to_s}")
            end
          end

          define_method "#{dimension}=" do |d|
            new_depth = Artworker::Dimensions.write_dimension(d)
            write_attribute(dimension, new_depth)
          end
          
        end
      end
    end
    
    def self.format_total_dimensions(dimensions)
      dimensions.each do |dimension_type|
        
        define_method "#{dimension_type[0]}" do
          dim_array = []
          dimension_type[1].each do |dimension_entry|
            dimension_entry = eval "self.#{dimension_entry}"
            dim = dimension_entry unless dimension_entry.blank?
            dim_array << dim
          end
          if metric?
            suffix = " centimeters"
          else
            suffix = " inches"
          end
          total_dimensions = dim_array.compact.join(' x ') + suffix unless dim_array.compact.join(' x ') == ''
        end
        
        define_method "#{dimension_type[0]}_in_inches" do
          dim_array = []
          dimension_type[1].each do |dimension_entry|
            dimension_entry = eval "self.#{dimension_entry}_in_inches"
            dim = dimension_entry unless dimension_entry.blank?
            dim_array << dim
          end
          suffix = " inches"
          total_dimensions = dim_array.compact.join(' x ') + suffix unless dim_array.compact.join(' x ') == ''
        end

        define_method "#{dimension_type[0]}_in_centimeters" do
          dim_array = []
          dimension_type[1].each do |dimension_entry|
            dimension_entry = eval "self.#{dimension_entry}_in_centimeters"
            dim = dimension_entry unless dimension_entry.blank?
            dim_array << dim
          end
          suffix = " centimeters"
          total_dimensions = dim_array.compact.join(' x ') + suffix unless dim_array.compact.join(' x ') == ''
        end
        
      end
    end
    
    def self.read_dimension(dimension,use_fractions)
      if dimension > 0
        returned_dimension = dimension && (use_fractions ? Artworker::Fractions.round_to_nearest_fraction(dimension.to_s, "1/16") : dimension.to_s)
      else
        returned_dimension = ""
      end
      returned_dimension = returned_dimension.to_i unless returned_dimension != returned_dimension.to_i
      return returned_dimension
    end
    
    def self.write_dimension(dimension)
      if dimension.blank?
        dimension = 0
      end
      new_dimension = Artworker::Fractions.to_f(dimension)
      return new_dimension
    end
    
    protected
    
    def fractions?
      eval @@use_fractions
      rescue
      false
    end
    
    def metric?
      eval @@use_metric
      rescue
      false
    end
    
    def convert_to_inches(dimension)
      float_value = (dimension.to_f * 0.393700).round(2)
      float_value = float_value.to_i if float_value == float_value.to_i
      return float_value

    end

    def convert_to_centimeters(dimension)
      float_value = (Artworker::Fractions.to_f(dimension).to_f * 2.54).round(2)
      float_value = float_value.to_i if float_value == float_value.to_i
      return float_value
    end
    
  end
end