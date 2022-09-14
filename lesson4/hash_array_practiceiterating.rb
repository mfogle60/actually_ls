# Practice iterating over hashes and arrays
countries_cities = {
  sweden: %w(Gothenburg Malmo Stockholm),
  usa: %w(Boston Seattle Portland),
}

# what NOT to do
=begin
countries_cities.each do |k|
  countries_cities[:sweden].concat(['Linkjoping'])
end

p countries_cities
=end
#=> {:sweden=>["Gothenburg", "Malmo", "Stockholm", "Linkjoping", "Linkjoping", "Linkjoping"],
# :usa=>["Boston", "Seattle", "Portland"], :canada=>["Toronto", "Calgary", "Vancouver"]}

=begin
# breakdown of problem:
# Remember that we are trying to get the result => {sweden: ["Gothenburg", "Malmo", "Stockholm", "Linkjoping"]}
- So the reason it's doing that is because we're saying that for each of our
  keys we want to concat 'Linkjoping' to :sweden
=end

# We only want to focus on the iteration when its :sweden

# if we only want to focus on just one key, we use .select

countries_cities.select do |k, v|
  if k == :sweden
    # v['Linkjoping'] # This DID NOT work. Because we cannot put a string into an array
    countries_cities[k].push('Linkjoping')
  end
end

p countries_cities

# ==================================================================
# So to recap, we cannot add a String object to an existing array as the last item in it w/o
# .push or .append

# But we can add a value to a hash (if we have values that are hashes)
# by just referencing the local variable for value like this: value['String']
# Example:

states_city_county = {
  texas: {'Austin': 'Travis', 'San Antonio': 'Bexar'},
  new_mexico: {'Santa teresa': 'Dona Ana'}
}

# What key do we want to add our value(s) to? Do you want it to be all?
# If so, we need to do it like this:
states_city_county.each do |k, v|
  v["Las_cruces"] = 'Dona Ana'  # when we use v, we put in the key, then the value, this creates a new key-value pair
end

p states_city_county

# ==========================================
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# in this hash, we want to add a new key-value pair ('age_group', string)
# to every one of our keys

# so to do that we need to access every one of our values from our munsters hash
munsters.each do |name, details|
  case details["age"]
  when 0...18 # remember that ... means we will stop at 17, so the range from 0 to 17
    details["age_group"] = "kid" # adds in a new key-value pair 
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
