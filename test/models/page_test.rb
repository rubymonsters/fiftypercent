require 'test_helper'

class PageTest < ActiveSupport::TestCase

  test "pages have a globalized body" do
    current_locale = I18n.locale
    p              = Page.new(slug: 'a_slug', page_type: 'some_type')

    I18n.locale    = :de
    p.body         = 'german body'
    I18n.locale    = :en
    p.body         = 'english body'
    p.save!

    n = Page.where(slug: 'a_slug').first
    assert_equal 'german body',  n.translation_for(:de).body
    assert_equal 'english body', n.translation_for(:en).body
    I18n.locale = current_locale
  end

  test "abstract is extracted from the body" do
    p = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def')
    p.save!
    assert_equal 'abc', p.abstract
  end

  test "abstract is nil if body has no separator" do
    p = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abcdef')
    p.save!
    assert_nil p.abstract
  end

  test "still works if the body is empty" do
    p = Page.new(slug: 'a_slug', page_type: 'blog_post', body: nil)
    p.save!
    assert_nil p.abstract
  end



  test "main_body is extracted from the body" do
    p = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def')
    p.save!
    assert_equal 'def', p.main_body
  end

  test "main_body == body if body has no separator" do
    p = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abcdef')
    p.save!
    assert_equal 'abcdef', p.main_body
  end

  test "still works if the body is nil" do
    p = Page.new(slug: 'a_slug', page_type: 'blog_post', body: nil)
    p.save!
    assert_nil p.main_body
  end
end
