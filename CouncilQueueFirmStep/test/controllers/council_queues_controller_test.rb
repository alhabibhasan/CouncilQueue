require 'test_helper'

class CouncilQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @council_queue = council_queues(:one)
  end

  test "should get index" do
    get council_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_council_queue_url
    assert_response :success
  end

  test "should create council_queue" do
    assert_difference('CouncilQueue.count') do
      post council_queues_url, params: { council_queue: { name: @council_queue.name, queued_at: @council_queue.queued_at, service: @council_queue.service, type: @council_queue.type } }
    end

    assert_redirected_to council_queue_url(CouncilQueue.last)
  end

  test "should show council_queue" do
    get council_queue_url(@council_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_council_queue_url(@council_queue)
    assert_response :success
  end

  test "should update council_queue" do
    patch council_queue_url(@council_queue), params: { council_queue: { name: @council_queue.name, queued_at: @council_queue.queued_at, service: @council_queue.service, type: @council_queue.type } }
    assert_redirected_to council_queue_url(@council_queue)
  end

  test "should destroy council_queue" do
    assert_difference('CouncilQueue.count', -1) do
      delete council_queue_url(@council_queue)
    end

    assert_redirected_to council_queues_url
  end
end
