# load_by_elf = File.read("day1_input.txt").split("\n\n")
# elf_total = load_by_elf.map do |load|
#   load.split.map(&:to_i).sum
# end
# puts elf_total.max

puts File.read("input.txt").split("\n\n").map{|load| load.split.map(&:to_i).sum}.max