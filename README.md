# sinatra-evite

## Author
Zhengyang Zhou


## Brief introduction
A simple sinatra website

## Getting Started
Run “ruby a.rb -p [port number]” on terminal

## database:psql


## page introduction
        At the url ./    This is the homepage
        At the url ./persons list all the persons
        At the url ./events list all the events
        At the url ./registrations list all the registrations
        At the url ./person/new: display a form allowing the creation of a person
        At the url ./event/new: display a form allowing the creation of a event
        At the url ./registration/new: display a form allowing the creation of a registrations


## The forms detail:
  When creating person and events, I use the input boxes, very simple.
  However, when creating registration, I use select box/drop down list. This will only show the available user and events on the database without caring much more about how to handle invalid input.
       
## New Idea:
  In the future I will update the form in the creation of registration as autocomplete select box, which will invole the combination of ruby and jquery/javascript

## Testing:
        All the testing file is under spec folder


