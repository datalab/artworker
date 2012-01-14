require "spec_helper"

describe ArtworkModels do
  
  before(:each) do
    clean_database!
    @artwork = Factory(:artwork_models, :title => "Sample Artwork",
                                      :date => "2012",
                                      :height => "24.375",
                                      :width => "36.2",
                                      :depth => "2.15",
                                      :framed_height => "26.35",
                                      :framed_width => "38.65",
                                      :framed_depth => "3",
                                      :use_fractions => true,
                                      :use_metric => false)
  end
  
  it "should return the artwork title with date" do
    @artwork.title_with_date.should eq "Sample Artwork, 2012"
  end
  
  it "should return the artwork title (italicized) with date" do
    @artwork.italic_title_with_date.should eq "<em>Sample Artwork</em>, 2012"
  end
  
  it "should return the default height" do
    @artwork.height.should eq "24 3/8"
  end
  
  it "should return the default width" do
    @artwork.width.should eq "36 3/16"
  end
  
  it "should return the default depth" do
    @artwork.depth.should eq "2 1/8"
  end
  
  it "should return the default framed height" do
    @artwork.framed_height.should eq "26 3/8"
  end
  
  it "should return the default framed width" do
    @artwork.framed_width.should eq "38 5/8"
  end
  
  it "should return the default framed depth" do
    @artwork.framed_depth.should eq "3"
  end
  
  it "should return the height in inches" do
    @artwork.height_in_inches.should eq "24 3/8"
  end
  
  it "should return the height in centimeters" do
    @artwork.height_in_centimeters.should eq 61.91
  end
  
  it "should return the width in inches" do
    @artwork.width_in_inches.should eq "36 3/16"
  end
  
  it "should return the width in centimeters" do
    @artwork.width_in_centimeters.should eq 91.92
  end
  
  it "should return the depth in inches" do
    @artwork.depth_in_inches.should eq "2 1/8"
  end
  
  it "should return the depth in centimeters" do
    @artwork.depth_in_centimeters.should eq 5.4
  end
  
  it "should return the framed height in inches" do
    @artwork.framed_height_in_inches.should eq "26 3/8"
  end
  
  it "should return the framed height in centimeters" do
    @artwork.framed_height_in_centimeters.should eq 66.99
  end
  
  it "should return the framed width in inches" do
    @artwork.framed_width_in_inches.should eq "38 5/8"
  end
  
  it "should return the framed width in centimeters" do
    @artwork.framed_width_in_centimeters.should eq 98.11
  end
  
  it "should return the framed depth in inches" do
    @artwork.framed_depth_in_inches.should eq "3"
  end
  
  it "should return the framed depth in centimeters" do
    @artwork.framed_depth_in_centimeters.should eq 7.62
  end
  
  it "should return the default dimensions" do
    @artwork.dimensions.should eq "24 3/8 x 36 3/16 x 2 1/8 inches"
  end
  
  it "should return the dimensions in inches" do
    @artwork.dimensions_in_inches.should eq "24 3/8 x 36 3/16 x 2 1/8 inches"
  end
  
  it "should return the dimensions in centimeters" do
    @artwork.dimensions_in_centimeters.should eq "61.91 x 91.92 x 5.4 centimeters"
  end
  
  it "should return the default framed dimensions" do
    @artwork.framed_dimensions.should eq "26 3/8 x 38 5/8 x 3 inches"
  end
  
  it "should return the framed dimensions in inches" do
    @artwork.framed_dimensions_in_inches.should eq "26 3/8 x 38 5/8 x 3 inches"
  end
  
  it "should return the framed dimensions in centimeters" do
    @artwork.framed_dimensions_in_centimeters.should eq "66.99 x 98.11 x 7.62 centimeters"
  end
  
end
