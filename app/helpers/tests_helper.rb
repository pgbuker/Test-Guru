module TestsHelper

  TEST_LEVEL = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVEL[test.level] || :hero
  
    # case test.level 
    # when 0  
    #   'easy'
    # when 1
    #   'elementary'
    # when 2  
    #   'advanced'
    # when 3
    #   'hard'
    # else
    #   'hero'
    # end
  end

end
