def check_sequence_for_lab(seq)
  if /lab/.match(seq.downcase)
    puts seq
  end
end

check_sequence_for_lab("laboratory")

check_sequence_for_lab("experiment")

check_sequence_for_lab("Pans Labyrinth")

check_sequence_for_lab("elaborate")

check_sequence_for_lab("polar bear")
