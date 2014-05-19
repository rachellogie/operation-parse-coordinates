
require_relative '../lib/MapParser'

describe 'MapParser' do
  it 'can return a coordinate given an ascii map' do

    input_map = <<HERE
+==========+
|X*********|
|**********|
|**********|
|**********|
|**********|
+==========+
HERE

    expected = [0,0]
    actual = MapParser.new(input_map).find_coordinate
    expect(actual).to eq(expected)
  end

  it 'can return a coordinate with negatives in it' do

    input_map = <<HERE
+======+
|******|
|******|
|*X****|
+======+
HERE

    expected = [1,-2]
    actual = MapParser.new(input_map).find_coordinate
    expect(actual).to eq(expected)
  end

  it 'can return a coordinate with for a large map' do

    input_map = <<HERE
+===================================+
|***********************************|
|***********************************|
|***********************************|
|******X****************************|
|***********************************|
|***********************************|
|***********************************|
|***********************************|
+===================================+
HERE

    expected = [6,-3]
    actual = MapParser.new(input_map).find_coordinate
    expect(actual).to eq(expected)
  end
end