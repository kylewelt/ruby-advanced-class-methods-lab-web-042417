require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # initializes a song and saves it to the @@all class variable
    # either literally or through the class method Song.all
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    # takes in the string name of a song and returns a song instance
    # with that name set as its name property
    # Song.new_by_name should return an instance of Song
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    # takes in the string name of a song and returns a song instance
    # with that name set as its name property and the song being
    # saved into the @@all class variable
    song = self.new_by_name(name)
    song
  end

  def self.find_by_name(name)
    # accepts the string name of a song and returns the matching
    # instance of the song with that name
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # accept a string name for a song and either return a matching
    # song instance with that name or create a new song with the
    # name and return the song instance
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    # returns all the song instances in alphabetical order by
    # song name
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    # accepts a filename in the format of "Artist - Track.mp3"
    # should return a new Song instance with the song name set
    # and the artist_name set
    parsed = filename.split(" - ")
    artist =  parsed[0]
    track = parsed[1].split(".")[0]

    song = self.new
    song.name = track
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    # accepts a filename in the format of "Artist - Track.mp3"
    # parse the filename correctly and also save the Song
    # instance that was created
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    # eset the state of the @@all class variable to an empty array
    # thereby deleting all previous song instances
    self.all.clear
  end

end
