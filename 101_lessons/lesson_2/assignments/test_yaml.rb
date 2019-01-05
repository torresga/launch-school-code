require 'yaml'

messages = YAML.load(File.read("messages-international.yml"))

operations = messages[0]["operations"]

salutations = messages[1]["salutations"]

questions = messages[2]["questions"]

warnings = messages[3]["warnings"]

answers = messages[4]["answers"]

display_results = messages[5]["display_results"]

lang = "fr"


p operations["addition"][lang]
#
# p salutations["language"]
#
# p questions["askingForNumbers"].first
#
# p warnings
#
# p answers
#
# p display_results

 # p messages.inspect


 def prompt(message)
   Kernel.puts("=> #{message}")
 end

 prompt(salutations["language"])
 lang = ''
 loop do
   lang = Kernel.gets().chomp()

   break if lang == 'en' || lang == 'fr'

   prompt(warnings["invalidLanguage"])
 end

 prompt(salutations["welcome"][lang])
