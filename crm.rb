require 'sinatra'
require_relative 'Contact.rb'

get '/' do
	@crm_app_name="Bill\'s CRM"
	erb :index
end

get '/contacts' do 
	@contacts=[]
  	@contacts << Contact.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  	@contacts << Contact.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  	@contacts << Contact.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
	erb :contacts
end

get '/contacts_new' do 
	erb :contacts_new
end