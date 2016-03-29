class Critter < Struct.new(:name, :qualifier, :aside)
  def epiteth
    [name, qualifier].compact.join(" ")
  end
end

class Song
  DATA = [
    ["horse", nil, "She's dead, of course!"],
    ["cow", nil, "I don't know how she swallowed a cow!"],
    ["goat", nil, "Just opened her throat and swallowed a goat!"],
    ["dog", nil, "What a hog, to swallow a dog!"],
    ["cat", nil, "Imagine that, to swallow a cat!"],
    ["bird", nil, "How absurd to swallow a bird!"],
    [
      "spider",
      "that wriggled and jiggled and tickled inside her",
      "It wriggled and jiggled and tickled inside her.",
    ],
    ["fly", nil, "I don't know why she swallowed the fly. Perhaps she'll die."],
  ]

  attr_reader :critters
  def initialize
    @critters = DATA.map {|row| Critter.new(*row)}
  end

  def lyrics
    (1..8).map {|i|
      Verse.new(critters.last(i))
    }.join("\n")
  end
end

class Verse
  attr_reader :critters, :i
  def initialize(critters)
    @critters = critters
    @i = critters.length
  end

  def to_s
    case i
    when 1, 8
      "I know an old lady who swallowed a %s.\n" % critters.first.name +
      "%s\n" % critters.first.aside
    else
      "I know an old lady who swallowed a %s.\n" % critters.first.name +
      "%s\n" % critters.first.aside +
      "%s\n" % chain +
      "%s\n" % "I don't know why she swallowed the fly. Perhaps she'll die."
    end
  end

  private

  def chain
    critters.each_cons(2).map {|pair|
      motivation(*pair)
    }.join("\n")
  end

  def motivation(predator, prey)
    "She swallowed the %s to catch the %s." % [
      predator.name,
      prey.epiteth,
    ]
  end
end
