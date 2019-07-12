class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end
end

file = File.new("swap_letters_sample_text.txt").read
# text = Text.new(file.read)

text = file.clone

p file
p text

# p text.swap("a", "e")
