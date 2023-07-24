class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
  end

  def call
    Badge.all.each do |badge|
      create_badge(badge.rule) if send("passed_#{badge.rule}?", badge.name)
    end
  end

  private

  def passed_success_category?(title)
    category_tests = Test.by_category(title)
    passed_tests = @test_passages.passed.joins(:test).where("tests.category_id": @test.category_id)
    category_tests.pluck(:id).sort == passed_tests.distinct.pluck(:test_id).sort
  end
  

  def passed_success_on_first_try?(first_try)
    TestPassage.where(user: @user, test: @test).count == 1 if @test_passage.success?
  end

  def passed_success_all_level?(level)
    level_tests = Test.by_level(@test.level)
    passed_tests = @test_passages.passed.joins(:test).where("tests.level": @test.level)
    level_tests.pluck(:id).sort == passed_tests.distinct.pluck(:test_id).sort
  end


  def create_badge(rule)
    badge = Badge.find_by(rule: rule)
    badge_record = @user.user_badges.create(badge: badge)
    badge_record.save
  end
end
