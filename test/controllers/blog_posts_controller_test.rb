require 'test_helper'

class BlogPostsControllerTest < ActionController::TestCase
  test "should get show" do
    blog_post = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def', public: true)
    blog_post.save!

    get :show, id: blog_post.id
    assert_response :success
    assert_not_nil assigns(:post)
    assert_template :show
  end

  test "show action loads the right event" do
    blog_post = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def', public: true)
    blog_post.save!

    get :show, id: blog_post.id
    assert_equal assigns(:post), blog_post
  end

  test "index should show published blogpost" do
    blog_post = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def', public: true)
    blog_post.save!

    get :index
    assert_includes assigns(:posts), blog_post
  end

  test "index should not show unpublished blogpost" do
    blog_post = Page.new(slug: 'a_slug', page_type: 'blog_post', body: 'abc[---]def', public: false)
    blog_post.save!

    get :index
    assert_not_includes assigns(:posts), blog_post
  end
end
