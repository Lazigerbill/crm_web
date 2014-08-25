require 'sinatra'
require 'data_mapper'
require 'pry'

DataMapper.setup(:default, "sqlite3:database.sqlite3") #this is to setup the database file .sqlite3 is the file extension

class Contact	
	include DataMapper::Resource #so we can use the command built into DataMapper
	property :id, Serial
	property :first_name, String
	property :last_name, String
	property :email, String
	property :note, String

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

get '/contacts_new' do 
	erb :contacts_new
end

post '/contacts_new' do
contact = Contact.create(
	:first_name => params[:first_name],
	:last_name => params[:last_name], 
	:email => params[:email],
	:note => params[:note])
redirect '/contacts'
end

post '/search_results' do 
	@search_results = 
	Contact.all(:conditions =>{ :first_name.like => "%#{params[:first_name]}%"}) &
	Contact.all(:conditions =>{ :last_name.like => "%#{params[:last_name]}%"})
	erb :search_results
end

get '/contacts/:id' do 
	@contact = Contact.get(params[:id])
	erb :show_contact
end

put '/edit/:id' do
	@contact = Contact.get(params[:id])
	@contact.update(
	:first_name => params[:first_name],
	:last_name => params[:last_name], 
	:email => params[:email],
	:note => params[:note])
redirect '/contacts'
end

get '/delete/:id' do 
	@contact = Contact.get(params[:id])
	@contact.destroy
	redirect '/contacts'
end


