cities = {
  africa: ['Johannesburg', 'Petoria'],
  south_america: ['Rio de Janeiro', 'Buenos Aires', 'Santiago'],
  north_america: ['New York City', 'Boston', 'Ottawa', 'Toronto'],
  middle_east: ['Muscat', 'Dubai', 'Damascus']
}

# .select will return a new hash with the key-value(s) selected
middle_eastern_cities = cities.select do |k, v|
  if k == :middle_east
    v
  end
end
# => {:middle_east=>["Muscat", "Dubai", "Damascus"]}

# when using .select and conditional statements, the 'else' is treated as falsey

animals_breeds = {
  cats: %w(Calico Tabby Sphinx),
  dogs: %w(Retriever Collie Dalmation)
}

# first what we want to do is print out, that each element in `dogs` is a dog
# breed

animals_breeds.select do |k, v|
  if k == :dogs
    animals_breeds[k].each do |animal|
      puts "#{animal} is a dog breed!" # this returns nil
    end
  else
    if k == :cats # this is treated as a falsey value
      "#{v}" # => {:cats, ["Calico", "Tabby", "Sphinx"]}
    end
  end
end
# =>  => {:cats=>["Calico", "Tabby", "Sphinx"], :dogs=>["Retriever", "Collie", "Dalmation"]}

# let's do one more practice of .select on a hash
states_city_county = {
  new_mexico: {'Las Cruces': 'Dona Ana'},
  texas: {'Austin': 'Travis'},
  massachusets: {'Boston': 'Suffolk'}
}

city_i_want = states_city_county.select do |k, v|
  if k == :new_mexico
    states_city_county[k]
  elsif k == :texas
    states_city_county[k]
  else
    if k == :massachusets
      [k]
    end
  end
end
# remember that truthy values are returned to the collection


# remember in .map that the else condition in conditial stmnts returns nil

countries_and_caps = {
  sweden: 'Stockholm',
  finland: 'Oslo',
  norway: 'Budapest'
}

corrected = countries_and_caps.map do |k, v|
  if k == :finland
    v = 'Helsinki'
  elsif k == :norway
    v = 'Oslo'
  else # this returns nil if we put k[v] in the block, to fix it just put v 
    k[v]
  end
end
# => [nil, "Helsinki", "Oslo"]
