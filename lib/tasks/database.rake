require 'rubygems'
namespace :database do
  desc "Injects airports.csv into the database."
  task :load_airports => [:environment] do
    
    CSV.foreach( "#{Rails.root}/app/assets/misc/airports.csv",
                  :headers           => true,
                  :header_converters => :symbol ) do |line|
      Airport.create!(line.to_hash)
    end
  end
end