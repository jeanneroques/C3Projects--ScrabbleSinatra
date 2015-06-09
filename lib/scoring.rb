class Scrabble
  # SCORE is constant within the class-- tiles always have the same value
  SCORE = {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1,
           "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
           "d" => 2, "g" => 2, "b" => 3, "c" => 3, "m" => 3,
           "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4,
           "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" =>10,
           "z" => 10}

  def self.score(word)
    total_points = 0
    # check to see that the input is actually a string (not nil or a number)
    raise ArgumentError.new "You can only use strings" unless word.class == String

    # check that the string only contains valid English letters, no numbers or symbols, controls for case
    word_array = word.chars.map { |each| each.downcase }
    raise ArgumentError.new "You can only use standard English letters" unless word_array.all? { |letter| SCORE[letter] }

    # check that the string is between 1 and 7 letters
    raise ArgumentError.new "You must play between 1 and 7 letters" unless word_array.length >= 1 && word_array.length <= 7

    # Finally a valid word! Assigning a point value to each letter in the array
    word_array.each do |letter|
      total_points += SCORE[letter]
    end
    return total_points
  end

  def self.letter_values(word)
    letters_hash = {}
    word.downcase.split("").each do |letter|
      letters_hash[letter]=SCORE[letter]
    end
    return letters_hash
  end

  def self.score_multiple(words)
    scores = {}
    words.each do |word|
      scores[word] = score(word)
    end
    return scores
  end

  def self.all_letter_values(words)
    all_letters_array = []
    words.each do |word|
      all_letters_array.push(letter_values(word))
    end
    return all_letters_array
  end

end
