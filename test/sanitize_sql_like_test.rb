require 'test_helper'

class SanitizeSqlLikeTest < Minitest::Test
  def setup

  end
  def test_that_it_has_a_version_number
    refute_nil ::SanitizeSqlLike::VERSION
  end
  def test_escape_percent
    assert_equal('name\\%', User.send(:sanitize_sql_like, 'name%'))
  end
  def test_escape_underline
    assert_equal('.name\\_', User.send(:sanitize_sql_like, '.name_'))
  end

  def test_util
    assert_equal(%w(John1 John2 John3), User.where('name LIKE ?', 'John%').pluck(:name))
    assert_equal([], User.where('name LIKE ?', User.send(:sanitize_sql_like, 'John%')).pluck(:name))
  end
end
