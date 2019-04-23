require_relative 'git_metrics'
require 'minitest/autorun'

class TestGitMetrics < MiniTest::Test

  def test_commit_example
  	assert_equal 2, num_commits(["commit abc", "commit 123"]), "Should have counted two commits"
  end

  def test_dates_with_three_days
  	exp = [ "Date:  Sun Jan 26 21:25:22 2014 -0600", \
  			"Date:  Sun Jan 23 21:25:22 2014 -0600", \
  			"Date:  Sun Jan 25 21:25:22 2014 -0600"]
    assert_equal 4, days_of_development(exp), "Should have been a 4 days difference"
  end

  #Add more tests here

  def test_number_commits
    assert_equal 4, num_commits(["commit 123", "commit 124", "commit 125", "commit 126"]), "Should have counted four commits."
  end

  def test_number_dev
    assert_equal 3, num_developers(["Author: Eugene Korbut <me@mvl.ru>", "Author: Jeff Felchner <accounts+git@thekompanee.com>", "Author: Eggs Ample <example@fakename.com>"]), "Should have counted three developers."
  end

  def test_number_days_zero
    assert_equal 0, days_of_development(["", "", ""]), "Shouldn't have counted any days."
  end

  def test_number_days
    assert_equal 4, days_of_development(["Date: Sun Jan 26 21:25:22 2014 -0600", "Date: Thu Jan 23 14:21:43 2014 +0700"]), "Should have counted four days."
  end

  def test_number_days_one
    assert_equal 1, days_of_development(["Date: Sun Jan 26 14:25:22 2014 -0600", "Date: Sun Jan 26 21:25:22 2014 -0600"]), "Should have counted one day."
  end

end
