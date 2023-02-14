describe "fizz_buzz.rb" do
  
  it "should output the correct response", points: 1 do
    # Un-require fizz_buzz.rb
    fizz_buzz = $".select{|r| r.include? 'fizz_buzz.rb'}
    $".delete(fizz_buzz.first)
    response = File.read("spec/support/fizz_buzz.txt")
    expected = File.read("spec/support/fizz_buzz_output.txt")

    output = with_captured_stdout { require_relative('../../fizz_buzz')} 
    output = "empty" if output.empty? 
    expect(output.match?(Regexp.new(response))).to be(true),
      "Expected output to be '#{expected}', but was #{output}."

  end
end

describe "letter_count.rb" do
  
  it "should count 1 to 6 with the input of 'banana'", points: 1 do
    # Un-require letter_count.rb
    letter_count = $".select{|r| r.include? 'letter_count.rb'}
    $".delete(letter_count.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("banana\n")
    
    response = /1\n2\n3\n4\n5\n6\n.*banana is 6 letters long/i

    output = with_captured_stdout { require_relative('../../letter_count')} 
    output = "empty" if output.empty? 
    expect(output.match?(response)).to be(true),
      "Expected output to be 'Enter a word:\\n1\\n2\\n3\\n4\\n5\\n6\\nbanana is 6 letters long', but was #{output}."

  end
end

describe "letter_count.rb" do
  
  it "should count 1 to 15 with the input of 'fantasmagorical'", points: 1 do
    # Un-require letter_count.rb
    letter_count = $".select{|r| r.include? 'letter_count.rb'}
    $".delete(letter_count.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("fantasmagorical\n")
    
    response = /1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\n.*fantasmagorical is 15 letters long/i

    output = with_captured_stdout { require_relative('../../letter_count')} 
    output = "empty" if output.empty? 
    expect(output.match?(response)).to be(true),
      "Expected output to be 'Enter a word:\\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15\nfantasmagorical is 15 letters long', but was #{output}."

  end
end

describe "letter_count.rb" do
  
  it "should count 1 with the input of 'a'", points: 1 do
    # Un-require letter_count.rb
    letter_count = $".select{|r| r.include? 'letter_count.rb'}
    $".delete(letter_count.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("a\n")
    
    response = /1\n.*a is 1 letters long/i

    output = with_captured_stdout { require_relative('../../letter_count')} 
    output = "empty" if output.empty? 
    expect(output.match?(response)).to be(true),
      "Expected output to be 'Enter a word:\\n1\na is 1 letters long', but was #{output}."

  end
end

describe "multiples.rb" do
  
  it "should print the correct multiples from 1 to 10 with the input of '2'", points: 1 do
    # Un-require letter_count.rb
    multiples = $".select{|r| r.include? 'multiples.rb'}
    $".delete(multiples.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("2\n")
    
    response = /2\n4\n6\n8\n10\n12\n14\n16\n18\n20/i

    output = with_captured_stdout { require_relative('../../multiples')} 
    output = "empty" if output.empty? 
    expect(output.match?(response)).to be(true),
      "Expected output to be 'Enter a number:\\n2\\n4\\n6\\n8\\n10\\n12\\n14\\n16\\n18\\n20', but was #{output}."

  end
end

describe "multiples.rb" do
  
  it "should print the correct multiples from 1 to 10 with the input of '3'", points: 1 do
    # Un-require letter_count.rb
    multiples = $".select{|r| r.include? 'multiples.rb'}
    $".delete(multiples.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("3\n")
    
    response = /3\n6\n9\n12\n15\n18\n21\n24\n27\n30/i

    output = with_captured_stdout { require_relative('../../multiples')} 
    output = "empty" if output.empty? 
    expect(output.match?(response)).to be(true),
      "Expected output to be 'Enter a number:\\n3\\n6\\n9\\n12\\n15\\n18\\n21\\n24\\n27\\n30', but was #{output}."

  end
end

describe "multiples.rb" do
  
  it "should print the correct multiples from 1 to 10 with the input of '0'", points: 1 do
    # Un-require letter_count.rb
    multiples = $".select{|r| r.include? 'multiples.rb'}
    $".delete(multiples.first)
    
    allow_any_instance_of(Object).to receive(:gets).and_return("0\n")
    
    response = /0\n0\n0\n0\n0\n0\n0\n0\n0\n0/i

    output = with_captured_stdout { require_relative('../../multiples')} 
    output = "empty" if output.empty? 
    expect(output.match?(response)).to be(true),
      "Expected output to be 'Enter a number:\\n0\\n0\\n0\\n0\\n0\\n0\\n0\\n0\\n0\\n0', but was #{output}."

  end
end

def with_captured_stdout
  original_stdout = $stdout  # capture previous value of $stdout
  $stdout = StringIO.new     # assign a string buffer to $stdout
  yield                      # perform the body of the user code
  $stdout.string             # return the contents of the string buffer
ensure
  $stdout = original_stdout  # restore $stdout to its previous value
end
