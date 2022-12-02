rounds = File.read("input.txt").split("\n")
# part 1
p1_round_scores = rounds.map do |round|
  them, you = round.split
  them_num = them.ord - "A".ord
  you_num = you.ord - "X".ord
  game_score = if them_num == you_num
    3
  # elsif (them_num < you_num && !(them_num == 0 && you_num == 2)) || them_num == 2 && you_num == 0
  elsif (you_num - them_num) % 3 == 1
    6
  end
  (game_score || 0) + you_num + 1 # zero index
end
# puts round_scores
puts p1_round_scores.sum

# part 2
p2_round_scores = rounds.map do |round|
  them, outcome = round.split
  them_num = them.ord - "A".ord
  case outcome
  when "X"
    ((them_num - 1) % 3) + 1 # zero index
  when "Y"
    3 + them_num + 1 # zero index
  when "Z"
    6 + ((them_num + 1) % 3) + 1 # zero index
  end
end
puts p2_round_scores.sum


# part 1
puts File.read("input.txt").split("\n").map(&:split).map{|them, you| [them.ord - "A".ord, you.ord - "X".ord]}
  .map{|them_num, you_num| them_num == you_num ? [3, you_num] : (you_num - them_num) % 3 == 1 ? [6, you_num] : [0, you_num]}
  .reduce(0) {|acc, n| acc + n[0] + n[1] + 1}

# part 2
puts File.read("input.txt").split("\n").map(&:split).map{|them, you| [them.ord - "A".ord, you]}
  .map{|them_num, outcome| outcome == "X" ? ((them_num - 1) % 3) : outcome == "Y" ? 3 + them_num : 6 + ((them_num + 1) % 3)}
  .reduce(0) {|acc, n| acc + n + 1}