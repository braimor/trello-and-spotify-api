About This App:

Small rails program that connects with Trello and Spotify APIs creating cards since a .csv file.


Main Characteristics:

Language: Ruby 3.0.0

Framework: Rails 6.1.4.6


Other Gems:

dotenv-rails:

For environment variables
https://github.com/bkeepers/dotenv

ruby-trello:

To connect with Trello's API
https://github.com/jeremytregunna/ruby-trello

rspotify:

To connect with Spotify's API
https://github.com/guilhermesad/rspotify


Getting Started:

Make sure that you have Rails 6, git cli and bundle installed.

Clone this repo using 'git clone https://github.com/braimor/trello-and-spotify-api.git' 
Create your .env file. You have an example at .env.template. You should be able to copy it and set your own values.


Run:

bundle install
rails server
rails db:seed
