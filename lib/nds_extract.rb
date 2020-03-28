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
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
    x = 0
    a_o_h_with_director_key =[]

  while x < movies_collection.size do
    a_o_h_with_director_key.push(movie_with_director_name(name, movies_collection[movie_index]))
    movie_index += 1
  end
  a_o_h_with_director_key
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
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
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
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
