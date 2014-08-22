require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3") #this is to setup the database file .sqlite3 is the file extension

class Contact	
	include DataMapper::Resource #so we can use the command built into DataMapper
	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :note, String
	# attr_accessor(:id, :first_name, :last_name, :email, :note)
  	# def initialize(id=nil,first_name=nil, last_name=nil, email=nil, note=nil)
   	#  	@id = id
   	#  	@first_name = first_name
   	#  	@last_name = last_name
   	#  	@email = email
   	#  	@note = note
end

DataMapper.finalize
DataMapper.auto_upgrade!



get '/' do
	erb :index
end

get '/contacts' do 
 	@contacts = Contact.all
	erb :contacts
end

get '/about' do 
	erb :about
end

get '/photos' do 
	erb :photos
end

get '/contacts/new' do 
	erb :contacts_new
end

# post '/contacts' do
#   puts params

post '/contacts' do
contact = Contact.create(
	:first_name => params[:first_name],
	:last_name => params[:last_name], 
	:email => params[:email],
	:note => params[:note])

redirect '/contacts'

end