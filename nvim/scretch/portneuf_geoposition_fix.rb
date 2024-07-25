# fix Donnacona locations
locations = Location.joins(:geoposition).where('geopositions.description like ?', 'Donnacona,%').each do |location|
  splitted = location.name.split(' ')

  query = splitted[0..-3].join(' ')
  puts query

  geocoded = Services::Geocoder::Search.new(
    query,
    verbose: true,
    force: true
  ).result

  new_address_description = geocoded.address
  puts new_address_description
  puts geocoded.coordinates

  location.update!(name: new_address_description)
  location.geoposition.update!(
    description: new_address_description,
    lat: geocoded.coordinates[0],
    long: geocoded.coordinates[1]
  )
end

# Fix Pont Rouge locations
locations = Location.joins(:geoposition).where('geopositions.description like ?', 'Pont-Rouge,%').each do |location|
  splitted = location.name.split(' ')

  query = splitted[0..-3].join(' ')
  puts query

  geocoded = Services::Geocoder::Search.new(
    query,
    verbose: true,
    force: true
  ).result

  new_address_description = geocoded.address
  puts new_address_description
  puts geocoded.coordinates

  location.update!(name: new_address_description)
  location.geoposition.update!(
    description: new_address_description,
    lat: geocoded.coordinates[0],
    long: geocoded.coordinates[1]
  )
end

# Fix St-Leonard locations
Location.find_by(file_number: '200019').tap do |location|
  splitted = location.name.split(' ')

  query = splitted[0..-3].join(' ') + '-De-Portneuf'
  puts query

  geocoded = Services::Geocoder::Search.new(
    query,
    verbose: true,
    force: true
  ).result

  new_address_description = geocoded.address
  puts new_address_description
  puts geocoded.coordinates

  location.update!(name: new_address_description)
  location.geoposition.update!(
    description: new_address_description,
    lat: geocoded.coordinates[0],
    long: geocoded.coordinates[1]
  )
end
