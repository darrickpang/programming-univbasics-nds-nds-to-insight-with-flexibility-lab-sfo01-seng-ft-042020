# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  x = 0
  while x < aoa.length do
    y = 0
    while y < aoa[x].length do
      result.push(aoa[x][y])
      y += 1
    end
    x += 1
  end
  return result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)

    x = 0
    a_o_h_with_director_key =[]

  while x < movies_collection.size do
    a_o_h_with_director_key.push(movie_with_director_name(name, movies_collection[x]))
    x += 1
  end
  return a_o_h_with_director_key
end


def gross_per_studio(collection)
  
  director_index = 0
  studio_gross_totals = Hash.new

  while director_index < collection.size do
    if !( studio_gross_totals.has_key? 'collection[director_index][:studio]' )
      studio_gross_totals[collection[director_index][:studio]] = 0
    end
    director_index += 1
  end
  director_index = 0

  while director_index < collection.size do
    studio_gross_totals[collection[director_index][:studio]] += collection[director_index][:worldwide_gross]
    director_index += 1
  end
  return studio_gross_totals
end

def movies_with_directors_set(source)
  
  director_index = 0
  director_movie_array = [[]]

  while director_index < source.size do
    director_movie_array[director_index] = movies_with_director_key(source[director_index][:name], source[director_index][:movies])
    director_index += 1
  end
  director_movie_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
