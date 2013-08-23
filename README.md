#Artworker

The Artworker gem provides many of the basic functions needed when dealing with a collection of different fine artwork and artists. The gem does this by providing access to  universally needed attributes (based on museum standards).

##Installation

Install the gems from rubygems.org.

    gem install artworker

Or, if you are using Bundler, which you should, you can add the following to you your Gemfile

    gem 'artworker'

You will also want to make sure that your database has the necessary. 

In the migration file for your artwork model, make sure you have columns for the following standard artwork attributes:

* Title Column => Either string or text.
* Date Column => Either string or text.
* Height Column => Decimal, that defaults to 0.
* Width Column => Decimal, that defaults to 0.
* Depth Column => Decimal, that defaults to 0.

Optionally, you can define other columns for artworker. Those columns can provide added functionality to override the defaults:

* Use Fractions Column => Boolean, default can be set to true if you want to use fractions instead of decimals.
* Use Metric System Column => Boolean, default can be set to true if you want to use centimeters instead of inches.

You can also assign other dimension types like paper, or framed, or base. Simply add those dimensions as decimal columns, making sure they default to 0.

Here is a sample migration that includes the basic columns, optional columns, and columns to record the frame dimensions:

  	class CreateArtworks < ActiveRecord::Migration
  	  def self.up
  	    create_table :artworks do |t|
  	      t.string :title
  	      t.string :date
  	      t.decimal :height, :null => false, :default => 0, :scale => 4, :precision => 10
  	      t.decimal :width, :null => false, :default => 0, :scale => 4, :precision => 10
  	      t.decimal :depth, :null => false, :default => 0, :scale => 4, :precision => 10
  	      t.decimal :framed_height, :null => false, :default => 0, :scale => 4, :precision => 10
  	      t.decimal :framed_width, :null => false, :default => 0, :scale => 4, :precision => 10
  	      t.decimal :framed_depth, :null => false, :default => 0, :scale => 4, :precision => 10
  	      t.boolean :use_fractions, :default => true, :null => false
  	      t.boolean :use_metric, :default => false, :null => false
  	      t.timestamps
  	    end
  	  end

  	  def self.down
  	    drop_table :artworks
  	  end
  	end

In the migration file for your artist model, make sure you have columns for the following standard artist attributes:

* First Name Column => Either string or text.
* Last Name Column => Either string or text.
* Birth Date Column => Either integer, string or text.
* Death Date Column => Either integer, string or text.
* Nationlity Column => Either string or text.

Here is a sample migration that includes the basic columns:

  	class CreateArtists < ActiveRecord::Migration
  	  def self.up
  	    create_table :artists do |t|
  	      t.string :firstname
  	      t.string :lastname
  	      t.string :birth
  	      t.string :death
  	      t.string :nationality
  	      t.timestamps
  	    end
  	  end

  	  def self.down
  	    drop_table :artists
  	  end
  	end

---

##Usage

###Artwork Model

You can add the `uses_artworker_artwork` command to your artwork model. You may alter the options to match the columns in your database (though it may not be necessary if your columns match the default options). Here is the sample usage of the `uses_artworker_artwork` command for the model based on the above sample migration:

  	uses_artworker_artwork :title => :title,
                          :date => :date,
                          :use_fractions => :use_fractions,
                          :use_metric => :use_metric,
                          :dimensions => {  :dimensions => [:height, :width, :depth], 
                                            :framed_dimensions => [:framed_height, :framed_width, :framed_depth]}

You should now be able to use the attributes that Artworker provides. Below is a list of those attributes for the sample model:

  	title_with_date
  	italic_title_with_date
  	height
  	width
  	depth
  	framed_height
  	framed_width
  	framed_depth
  	height_in_inches
  	height_in_centimeters
  	width_in_inches
  	width_in_centimeters
  	depth_in_inches
  	depth_in_centimeters
  	framed_height_in_inches
  	framed_height_in_centimeters
  	framed_width_in_inches
  	framed_width_in_centimeters
  	framed_depth_in_inches
  	framed_depth_in_centimeters
  	dimensions
  	dimensions_in_inches
  	dimensions_in_centimeters
  	framed_dimensions
  	framed_dimensions_in_inches
  	framed_dimensions_in_centimeters

###Artist Model

Once you have created your migration file and migrated your database. You can add the `uses_artworker_artist` command to your model. You may alter the options to match the columns in your database (though it may not be necessary if your columns match the default options). Here is the sample usage of the `uses_artworker_artist` command for the model based on the above sample migration:

   	uses_artworker_artist :firstname => :firstname,
                       :lastname => :lastname,
                       :birth => :birth,
                       :death => :death,
                       :nationality => :nationality

You should now be able to use the attributes that Artworker provides. Below is a list of those attributes for the sample model:

  	fullname
  	dates
  	fullname_with_dates
  	fullname_with_nationality_and_dates

---

##Troubleshooting and FAQs

###Why did you make this gem?

There's only so many times that you can write the same code in project to project before you get really sick of it. We've made enough sites for organizations in the art world to know this will alleviate our need for repetitious code. 

###What are the default options?

For the artwork options, the defaults are:

  		:title => :title
  		:date => :date
  		:use_fractions => :use_fractions (or false if column does not exist)
  		:use_metric => :use_metric (or false if column does not exist)
  		:dimensions => { :dimensions => [:height, :width, :depth] }

For the artist options, the defaults are:

  		:firstname => :firstname
  		:lastname => :lastname
  		:birth => :birth
  		:death => :death
  		:nationality => :nationality

###The fractions aren't formatting properly in an input field?

Yes, this is as Rails intended. You can override this by explicitly declaring the value of the input field.

###Why doesn't this gem also handle images?

Everybody has their own methods for working with images, so it doesn't seem too advantageous at this point to include that functionality. With that being said, it may get added in the future.

###Where are the tests?

Glad you asked! The testing environment is rspec, and the tests can be found in the spec directory. 

---

##Development

If you find an issue or bug, please let us know. You can file your issue on the project's issue tracker at github. 

[http://github.com/datalab/artworker/](http://github.com/datalab/artworker/)

We encourage you to fork this project and make any changes you would like! Please feel free to submit a pull request if you make any cool additions.
