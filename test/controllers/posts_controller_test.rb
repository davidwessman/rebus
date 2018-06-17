# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should show post' do
    post = Post.create(title: 'Adrians Examenspresent', slug: 'adrian', answer: 'Secret')
    get(post_path(post))
    assert_response(:success)
  end
end
