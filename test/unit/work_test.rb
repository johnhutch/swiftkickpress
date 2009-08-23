require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  fixtures :works
  
  def test_score
    work_test = works(:five)
    print work_test.title
    print work_test.score
    assert_not_nil(work_test.score)
  end
  
end
