require 'test_helper'

class BlogPostsControllerTest < ActionController::TestCase
  test "should get show" do
    blog_post = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def')
    blog_post.save!

    get :show, id: blog_post.id
    assert_response :success
    assert_not_nil assigns(:post)
    assert_template :show
  end

  test "show action loads the right event" do
    blog_post = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def')
    blog_post.save!

    get :show, id: blog_post.id
    assert_equal assigns(:post), blog_post
  end
end
