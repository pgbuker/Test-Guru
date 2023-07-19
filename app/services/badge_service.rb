class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      create_badge(badge.rule) if send("passed_#{badge.rule}?", badge.name)
    end
  end

  private

  def passed_success_category?(title)
    category = Category.find_by(title: title)
    success_tests.map(&:test_id).uniq.count == category.tests.count
  end
  

  def passed_success_on_first_try?(first_try)
    TestPassage.where(user: @user, test: @test).count == 1 if @test_passage.success?
  end

  def passed_success_all_level?(level)
    Test.where(level: level).map(&:id) == success_tests.map(&:test_id).uniq
  end

  def success_tests
    TestPassage.where(user: @user, test: @test, current_question: nil).select(&:success?)
  end

  def create_badge(rule)
    badge = Badge.find_by(rule: rule)
    badge_record = @user.user_badges.create(badge: badge)
    badge_record.save
  end
end
