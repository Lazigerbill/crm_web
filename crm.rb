require 'sinatra'
require_relative 'Contact.rb'
require_relative 'Rolodex.rb'

@@rolodex=Rolodex.new

get '/' do
	@crm_app_name="Bill\'s CRM"
	erb :index
end

get '/contacts' do 
  	# @@rolodex.contacts << Contact.new("","Julie", "Hache", "julie@bitmakerlabs.com", "Instructor")
  	# @@rolodex.contacts << Contact.new("","Will", "Richman", "will@bitmakerlabs.com", "Co-Founder")
  	# @@rolodex.contacts << Contact.new("","Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor")
	erb :contacts
end

get '/contacts/new' do 
	erb :contacts_new
end

# post '/contacts' do
#   puts params

post '/contacts' do
new_contact = Contact.new('',params[:first_name], params[:last_name], params[:email], params[:note])
@@rolodex.assign_id(new_contact)
redirect '/contacts'

end