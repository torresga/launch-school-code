# Point Mutations
#
# Write a program that can calculate the Hamming distance between two DNA strands.
#
# A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable by the accumulated result of beneficial microscopic mutations over many generations.
#
# The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.
#
# By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.
#
# This is called the 'Hamming distance'
#
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
#
# The Hamming distance between these two DNA strands is 7.
#
# The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

# Two strings of equal length
# If two strings are not of equal length, get length from shorter length, 0 up to shorter.length
# Compare each string at index - if different, add 1 to count

# - initialize
#   Input: A string representing a DNA strand
#   Output: None
#   Assign input to @initial_dna_strand
#
# - hamming_distance
#   Input: comparison dna strand represented as a string
#   Output: An integer representing the count of differences between the two strings
#   Algorithm
#   Create a count variable and assign it to 0
#   create variable shortest_string
#   find the shortest string
      # - if initial string is shorter
      #   - assign shortest_string to initial
      # - else
      #   - assign shortest_string to comparison string
#   find the longest string
#     if shortest string is the initial dna strand
#       assign longest string to comparison strand
#     else
#       assign longest string to initial dna strand
#   Loop through the shortest string with index |current|
#     if current and current character at longest string are different
#       add 1 to count
#  return count

class DNA
  def initialize(strand)
    @initial_dna_strand = strand
  end

  def hamming_distance(comparison_strand)
    count = 0
    shortest = @initial_dna_strand.length < comparison_strand.length ? @initial_dna_strand : comparison_strand
    longest = shortest == @initial_dna_strand ? comparison_strand : @initial_dna_strand

    shortest.chars.each_with_index do |current, index|
      count += 1 if longest[index] != current
    end

    count
  end
end
