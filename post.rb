require 'rubygems'
require "uri"
require "net/http"
require 'pry'

# params needs to be edited and fixed
params = {'box1' => 'Nothing is less important than which fork you use. Etiquette is the science of living. It embraces everything. It is ethics. It is honor. -Emily Post',
'button1' => 'Submit'
}
x = Net::HTTP.post_form(URI.parse('https://book.cebupacificair.com/Select.aspx'), params)
puts x.body