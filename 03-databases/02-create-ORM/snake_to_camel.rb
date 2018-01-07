def camel(snake_case)
  string = snake_case.gsub(/\//, '::')
  string.gsub!(/_/, ' ')
  string.split.map(&:capitalize).join('')
end

puts camel("make_this_camel_case")
