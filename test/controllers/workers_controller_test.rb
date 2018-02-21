require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get workers_url
    assert_response :success
  end

  test "should get new" do
    get new_worker_url
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post workers_url, params: { worker: { address_apartment: @worker.address_apartment, address_city: @worker.address_city, address_number: @worker.address_number, address_region: @worker.address_region, address_street: @worker.address_street, bithdate: @worker.bithdate, email: @worker.email, first_name: @worker.first_name, gender: @worker.gender, last_name1: @worker.last_name1, last_name2: @worker.last_name2, middle_name: @worker.middle_name, phone: @worker.phone, rut: @worker.rut } }
    end

    assert_redirected_to worker_url(Worker.last)
  end

  test "should show worker" do
    get worker_url(@worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_worker_url(@worker)
    assert_response :success
  end

  test "should update worker" do
    patch worker_url(@worker), params: { worker: { address_apartment: @worker.address_apartment, address_city: @worker.address_city, address_number: @worker.address_number, address_region: @worker.address_region, address_street: @worker.address_street, bithdate: @worker.bithdate, email: @worker.email, first_name: @worker.first_name, gender: @worker.gender, last_name1: @worker.last_name1, last_name2: @worker.last_name2, middle_name: @worker.middle_name, phone: @worker.phone, rut: @worker.rut } }
    assert_redirected_to worker_url(@worker)
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete worker_url(@worker)
    end

    assert_redirected_to workers_url
  end
end
