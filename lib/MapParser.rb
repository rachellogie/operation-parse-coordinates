class MapParser

  def initialize(input)
    @input = input
  end

  def find_coordinate
    #split into array on the new line
    lines_array = @input.split("\n")[1..-2]
    lines_array = lines_array.map { |line| line[1..-2]}
    y_coordinate = 0
    lines_array.each do |line|
      if line =~ /X/
        x_coordinate =  (line =~ /X/)
        return [x_coordinate, y_coordinate]
      end
      y_coordinate -= 1
    end

  end
end