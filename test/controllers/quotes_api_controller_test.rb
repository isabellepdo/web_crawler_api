require 'test_helper'

class QuotesApiControllerTest < ActionDispatch::IntegrationTest
	def setup
		@existing_tag_name = 'love'
		@existing_tag = Tag.find_or_create_by(name: @existing_tag_name)
	end

	test "should get quotes by existing tag" do
		get '/get_token'
		assert_response :success
		token = JSON.parse(response.body)['token']

		get "/api/quotes/#{@existing_tag_name}", headers: { 'Authorization': "Bearer #{token}" }
		assert_response :success
		assert_not_nil JSON.parse(response.body)['quotes']
	end

	test "should return unauthorized without token" do
		get "/api/quotes/#{@existing_tag_name}"
		assert_response :unauthorized
	end
end
