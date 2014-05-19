class RouteExplainer

  def initialize

  end

  def explain_route

    all_coordinates = []

    12.times.with_index do |index|
      input_map = map_you_want(index + 1)
      coordinate = MapParser.new(input_map).find_coordinate
      all_coordinates << coordinate
    end

    all_coordinates
    directions = ["started"]

    x_change, y_change = 0, 0

    all_coordinates.each.with_index do |coordinate, index|
      unless all_coordinates[index + 1].nil?
        x_change = coordinate[0] - all_coordinates[index + 1][0]
        y_change = coordinate[1] - all_coordinates[index + 1][1]


        if x_change == -1
          directions << "moved east by 1"
        elsif x_change == 1
          directions << "moved west by 1"
        elsif y_change == -1
          directions << "moved north by 1"
        elsif y_change == 1
          directions << "moved south by 1"
        end
      end
    end

    directions.join("\n") + "\n"
  end

  def map_you_want(num)
    num = "0#{num}" if num.to_s.length == 1
    File.read("./data/map-#{num}.txt")
  end
end