require_relative '../app'
require 'rspec'
#require 'spec_helper'
require 'rack/test'
require 'test/unit'
require 'byebug'

set :environment, :test

describe "app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET on /" do
    it "display the hints" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body.include?('Add a new event!')).to eql(true)
      expect(last_response.body.include?('Add a new person!')).to eql(true)
      expect(last_response.body.include?('Add a new registration!')).to eql(true)
    end
  end

  describe "GET on /persons" do
    before(:each) do
      Person.create(
        name: "test",
        date_of_birth: "1991-10-26",
        gender: "Male",
        zipcode: "12345")
    end

    it "display a person" do
      get '/persons'
      expect(last_response).to be_ok
      expect(last_response.body.include?('test')).to eql(true)
      expect(last_response.body.include?('1991-10-26')).to eql(true)
      expect(last_response.body.include?('Male')).to eql(true)
      expect(last_response.body.include?('12345')).to eql(true)
    end

    after(:each) do
      per = Person.find_by(name:"test")
      Person.delete(per.id)
    end
  end

  describe "GET on /events" do
    before(:each) do
      Event.create(
        name: 'test%^&^%',
        date: "2017-10-26")
    end

    it "display a person" do
      get '/events'
      expect(last_response).to be_ok
      expect(last_response.body.include?('test%^&^%')).to eql(true)
      expect(last_response.body.include?('2017-10-26')).to eql(true)
    end

    after(:each) do
      eve = Event.find_by(name:'test%^&^%')
      Event.delete(eve.id)
    end
  end

  describe "GET on /registrations" do
    before(:each) do
      Person.create(
        name: "test",
        date_of_birth: "1991-10-26",
        gender: "Male",
        zipcode: "12345")
      Event.create(
        name: 'test%^&^%',
        date: "2017-10-26")
      Registration.create(
        person_id: Person.find_by(name: "test").id,
        event_id: Event.find_by(name: 'test%^&^%').id,
        status: 'coming')
    end

    it "display a person" do
      get '/registrations'
      expect(last_response).to be_ok
      expect(last_response.body.include?("test")).to eql(true)
      expect(last_response.body.include?('test%^&^%')).to eql(true)
      expect(last_response.body.include?('coming')).to eql(true)
    end

    after(:each) do
      per = Person.find_by(name:"test")
      eve = Event.find_by(name:'test%^&^%')
      reg = Registration.find_by(person_id:per.id,event_id:eve.id,status:'coming')
      Registration.delete(reg.id)
      Person.delete(per.id)
      Event.delete(eve.id)
    end
  end


end
