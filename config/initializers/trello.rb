require 'trello'

Trello.configure do |trello|
  trello.developer_public_key = ENV["TRELLO_DEVELOPER_PUBLIC_KEY"]
  trello.member_token = ENV["TRELLO_MEMBER_TOKEN"]
end


