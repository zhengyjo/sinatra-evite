require 'pry-byebug'
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/person'
require_relative 'models/event'
require_relative 'models/registration'

get '/person/new' do
  erb :new_person
end

post '/persons/submit' do
  @person = Person.new(params[:person])
  if @person.save
    redirect '/persons'
  else
    "Sorry, there was an error!"
  end
end

get '/persons' do
  @persons = Person.all
  erb :persons
end

# Here to add an event and show all the events
get '/event/new' do
  erb :new_event
end

post '/events/submit' do
  @event = Event.new(params[:event])
  if @event.save
    redirect '/events'
  else
    "Sorry, there was an error!"
  end
end

get '/events' do
  @events = Event.all
  erb :events
end

# Here to add an registraion and show all the registrations
get '/registration/new' do
  @persons = Person.all
  @events = Event.all
  erb :new_registration
end

post '/registrations/submit' do
  @reg = Registration.new(params[:registration])
  if @reg.save
    redirect '/registrations'
  else
    "Sorry, there was an error!"
  end
end

get '/registrations' do
  @registrations = Registration.all
  erb :registrations
end
