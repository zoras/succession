gem 'minitest', '>= 5.0.0'
require 'minitest/pride'
require 'minitest/autorun'

require_relative 'song'

class SongTest < Minitest::Test
  def test_lyrics
    expected = <<-SONG
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a horse.
She's dead, of course!
    SONG
    assert_equal expected, Song.new.lyrics
  end

  def test_alternate_critters
    expected = <<-SONG
I know an old lady who swallowed an A.
IDK why A.

I know an old lady who swallowed a B.
Squee, B!
She swallowed the B to catch the A.
IDK why A.

I know an old lady who swallowed a C.
ZOMG C!
She swallowed the C to catch the B that blah blah.
She swallowed the B to catch the A.
IDK why A.

I know an old lady who swallowed a D.
Nope.
    SONG

    data = [
      ["D", nil, "Nope."],
      ["C", nil, "ZOMG C!"],
      ["B", "that blah blah", "Squee, B!"],
      ["A", nil, "IDK why A."],
    ]
    assert_equal expected, Song.new(data).lyrics
  end
end
