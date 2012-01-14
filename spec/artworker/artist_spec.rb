require "spec_helper"

describe ArtistModels do
  
  before(:each) do
    clean_database!
    @artist = Factory(:artist_models, :firstname => "Sample",
                                      :lastname => "Artist",
                                      :birth => "1900",
                                      :death => "2000",
                                      :nationality => "American")
  end
  
  it "should return the artist's fullname" do
    @artist.fullname.should eq "Sample Artist"
  end
  
  it "should return the artist's dates" do
    @artist.dates.should eq "1900 - 2000"
  end
  
  it "should return the artist's fullname with dates" do
    @artist.fullname_with_dates.should eq "Sample Artist (1900 - 2000)"
  end
  
  it "should return the artist's fullname with nationality and dates" do
    @artist.fullname_with_nationality_and_dates.should eq "Sample Artist (American, 1900 - 2000)"
  end
  
end