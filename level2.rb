def calc expression
  expression = expression.strip

  while not expression.gsub!(/\([-\/\*\+\.\d ]*\)/) {|sub| calc(sub[1..-2])} .nil? do expression.gsub!(/--/,'') end

  match = /\A(?<value>-?\d+)\z/.match(expression)
  return match[:value].to_i if match

  match = /\A(?<value>-?\d+\.\d+)\z/.match(expression)
  return match[:value].to_f if match

  ['+-', '*/'].each do |operators|
    match = /\A(?<left>.*[^\*\/\+ -]) ?(?<operator>[#{Regexp.escape(operators)}])(?<right>.+)\z/.match(expression)
    if match
      left = calc(match[:left])
      left = left.to_f if match[:operator] == "/"
      return left.send(match[:operator], calc(match[:right]))
    end
  end
end