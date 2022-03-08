require "csv"

rows = []
CSV.foreach(Rails.root.join('db', 'discography.csv'), headers: true, header_converters: :symbol) do |row|
  rows << row.to_h
end
sorted_array = rows.sort_by { |hash| [hash[:year], hash[:title]] }

board = Trello::Board.create(name: 'Bob Dylan')
default_lists = Trello::Board.find( board.id ).lists 

default_lists.each do |list|
    Trello::List.find( list.id ).close!
end

if board
    list60s = Trello::List.create(name: '60s', board_id: board.id)
    list70s = Trello::List.create(name: '70s', board_id: board.id)
    list80s = Trello::List.create(name: '80s', board_id: board.id)
    list90s = Trello::List.create(name: '90s', board_id: board.id)
    list2000s = Trello::List.create(name: '2000s', board_id: board.id)
    list2010s = Trello::List.create(name: '2010s', board_id: board.id)
end

sorted_array.each do |value|
    year = value[:year].to_i
    title = value[:title]

    album = RSpotify::Album.search(title)
    playlist = RSpotify::Playlist.search(title)

    if album.present?
        album = album.first
        album = album.images[0]["url"]
    elsif playlist.present?
        album = playlist.first
        album = album.images[0]["url"]
    else
        album = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Bob_Dylan_-_Azkena_Rock_Festival_2010_2.jpg/1200px-Bob_Dylan_-_Azkena_Rock_Festival_2010_2.jpg"
    end

    if year >= 1960 && year <= 1969
        card = Trello::Card.create(name: "#{title} - #{year}", list_id: list60s.id)
        attachment = card.add_attachment(album)
    elsif year >= 1970 && year <= 1979
        card = Trello::Card.create(name: "#{title} - #{year}", list_id: list70s.id)
        attachment = card.add_attachment(album)
    elsif year >= 1980 && year <= 1989
        card = Trello::Card.create(name: "#{title} - #{year}", list_id: list80s.id)
        attachment = card.add_attachment(album)
    elsif year >= 1990 && year <= 1999
        card = Trello::Card.create(name: "#{title} - #{year}", list_id: list90s.id)
        attachment = card.add_attachment(album)
    elsif year >= 2000 && year <= 2009
        card = Trello::Card.create(name: "#{title} - #{year}", list_id: list2000s.id)
        attachment = card.add_attachment(album)
    else
        card = Trello::Card.create(name: "#{title} - #{year}", list_id: list2010s.id)
        attachment = card.add_attachment(album)
    end
end
