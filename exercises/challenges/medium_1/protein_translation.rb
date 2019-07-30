# Protein Translation
#
# Lets write a program that will translate RNA sequences into proteins. RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:
#
# RNA: "AUGUUUUCU" => translates to
#
# Codons: "AUG", "UUU", "UCU"
# => which become a polypeptide with the following sequence =>
#
# Protein: "Methionine", "Phenylalanine", "Serine"
#
# There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.
#
# There are also four terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated. All subsequent codons after are ignored, like this:
#
# RNA: "AUGUUUUCUUAAAUG" =>
#
# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>
#
# Protein: "Methionine", "Phenylalanine", "Serine"
#
# Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--
#
# Below are the codons and resulting Amino Acids needed for the exercise.
#
# Codon 	Amino Acids
# AUG 	Methionine
# UUU, UUC 	Phenylalanine
# UUA, UUG 	Leucine
# UCU, UCC, UCA, UCG 	Serine
# UAU, UAC 	Tyrosine
# UGU, UGC 	Cysteine
# UGG 	Tryptophan
# UAA, UAG, UGA 	STOP

# Two methods:
# - of_codon: translates a string of three characters representing a codon to a string representing an amino acid
# - of rna: Takes a string and returns an array of strings representing amino acids

# of_codon:
# Input: A string of three characters
# Output: A String representing an amino acid
#
# Algorithm
# Case statement
# If AUG then Methionine
# If UUU, UUC then Phenylalanine
# If UUA, UUG then Leucine
# If UCU, UCC, UCA, UCG then Serine
# If UAU, UAC then Tyrosine
# If UGU, UGC then Cysteine
# If UGG then Tryptophan
# If UAA, UAG, UGA then STOP

# of_rna:
# Input: A string of three or more characters
# Output: An array of strings representing amino acids

# Algorithm
# 0. Raise error if any characters in string besides AUCG
# 1. Split string into of array of strings - 3 chars per string
# 2. Loop through array
# 3. Turn each string into its' amino acid
# 4. Break if the amino acid is STOP
# 5. Else add amino acid to new array
# 6. Return array of amino acids

class InvalidCodonError < StandardError; end

class Translation
  TERMINATING_CODON = "STOP"

  def self.of_codon(codon)
    case
    when codon == "AUG" then "Methionine"
    when %w(UUU UUC).include?(codon) then "Phenylalanine"
    when %w(UUA UUG).include?(codon) then "Leucine"
    when %w(UCU UCC UCA UCG).include?(codon) then "Serine"
    when %w(UAU UAC).include?(codon) then "Tyrosine"
    when %w(UGU UGC).include?(codon) then "Cysteine"
    when codon == "UGG" then "Tryptophan"
    when %w(UAA UAG UGA).include?(codon) then "STOP"
    end
  end

  def self.of_rna(sequence)
    raise InvalidCodonError if sequence.match?(/[^AUCG]/)

    amino_acids = []
    sequence.scan(/.../).each do |codon|
      current_amino_acid = self.of_codon(codon)
      break if current_amino_acid == TERMINATING_CODON
      amino_acids << current_amino_acid
    end

    amino_acids
  end
end
