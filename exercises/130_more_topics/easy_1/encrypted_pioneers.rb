# Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

# Nqn Ybirynpr
# Tenpr Ubccre
# Nqryr Tbyqfgvar
# Nyna Ghevat
# Puneyrf Onoontr
# Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
# Wbua Ngnanfbss
# Ybvf Unvog
# Pynhqr Funaaba
# Fgrir Wbof
# Ovyy Tngrf
# Gvz Orearef-Yrr
# Fgrir Jbmavnx
# Xbaenq Mhfr
# Fve Nagbal Ubner
# Zneiva Zvafxl
# Lhxvuveb Zngfhzbgb
# Unllvz Fybavzfxv
# Tregehqr Oynapu
#
# Write a program that deciphers and prints each of these names .

# Input: Two names, connected with a space
# Output: That name decrypted

# Replace letter with rot13 counterpart:
# Create a hash, a to z as keys, rot13 counterpart

# downcase letter
# Replace each letter with its' rot13 counterpart (13 letters after letter it is now)
# Upcase letter if letter is upcase
# Ignore non letters

input = ('a'..'z').to_a
output = ('n'..'z').to_a + ('a'..'m').to_a

ALPHABET = {}

input.each_with_index do |letter, index|
  ALPHABET[letter] = output[index]
end

def decrypt(name)
  name.chars.map do |letter|
    new_letter = ALPHABET[letter.downcase]
    if letter.match?(/[^a-z]/i)
      letter
    elsif letter == letter.upcase
      new_letter.upcase
    else
      new_letter
    end
  end.join
end

File.open("encrypted_pioneers_names.rb") do |name|
  puts decrypt(name)
end
