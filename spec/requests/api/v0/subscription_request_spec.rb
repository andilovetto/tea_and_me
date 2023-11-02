require "rails_helper"

RSpec.describe "subscription requests" do
  let(:customer_1) { create(:customer) }
  let(:tea_1) { create(:tea) }
  let(:tea_2) { create(:tea) }
  let(:tea_3) { create(:tea) }
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
  end

  describe "#create" do
    context "when call succeeds" do
      let(:create_params) do
        {
          customer_id: customer_1.id,
          tea_id: tea_1.id,
          price: 20.0,
          frequency: 0
        }.to_json
      end

      it "creates tea subscription and returns status 201" do
        post "/api/v0/subscriptions", headers: headers, params: create_params

        create_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(create_response).to have_key(:message)
        expect(create_response[:message]).to eq("Successfully created Tea & Me subscription!")
        expect(customer_1.subscriptions.count).to eq(1)
        expect(tea_1.subscriptions.count).to eq(1)
        expect(customer_1.subscriptions.first.customer_id).to eq(customer_1.id)
      end
    end

    context "when customer doesn't exist" do
      let(:create_params) do
        {
          customer_id: 100000000000,
          tea_id: tea_1.id,
          price: 20.0,
          frequency: 0
        }.to_json
      end

      it "returns a status 422" do
        post "/api/v0/subscriptions", headers: headers, params: create_params

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Couldn't find Customer with 'id'=100000000000")
      end
    end

    context "when a tea doesn't exist" do
      let(:create_params) do
        {
          customer_id: customer_1.id,
          tea_id: 1000000000,
          price: 20.0,
          frequency: 0
        }.to_json
      end

      it "returns a status 422" do
        post "/api/v0/subscriptions", headers: headers, params: create_params

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Couldn't find Tea with 'id'=1000000000")
      end
    end
  end

  describe "#update" do
    let!(:subscription_1) { create(:subscription, customer_id: customer_1.id, tea_id: tea_1.id, status: 0) }
    
    context "when a user wants to update subscription status from active to cancelled" do
      let(:update_params) do
        {
          customer_id: customer_1.id,
          tea_id: tea_1.id
        }.to_json
      end
   
      it "returns status 200" do
        patch "/api/v0/subscriptions/#{customer_1.id}", headers: headers, params: update_params

        update_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(update_response).to have_key(:message)
        expect(update_response[:message]).to eq("Successfully deactivated Tea & Me subscription!")        
      end
    end

    context "when a user wants to update subscription status from cancelled to active" do
      let!(:subscription_2) { create(:subscription, customer_id: customer_1.id, tea_id: tea_2.id, status: 1) }
      let(:update_params) do
        {
          customer_id: customer_1.id,
          tea_id: tea_2.id
        }.to_json
      end
   
      it "returns status 200" do
        patch "/api/v0/subscriptions/#{customer_1.id}", headers: headers, params: update_params

        update_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(update_response).to have_key(:message)
        expect(update_response[:message]).to eq("Successfully activated Tea & Me subscription!")        
      end
    end

    context "when a user doesn't exist" do
      let!(:subscription_3) { create(:subscription, customer_id: customer_1.id, tea_id: tea_1.id, status: 1) }
      let(:update_params) do
        {
          customer_id: 100000,
          tea_id: tea_1.id
        }.to_json
      end
   
      it "returns status 422" do
        patch "/api/v0/subscriptions/#{customer_1.id}", headers: headers, params: update_params

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Couldn't find Subscription with [WHERE \"subscriptions\".\"customer_id\" = $1 AND \"subscriptions\".\"tea_id\" = $2]")        
      end
    end

    context "when a tea doesn't exist" do
      let!(:subscription_4) { create(:subscription, customer_id: customer_1.id, tea_id: tea_1.id, status: 1) }
      let(:update_params) do
        {
          customer_id: customer_1.id,
          tea_id: 10000
        }.to_json
      end
   
      it "returns status 422" do
        patch "/api/v0/subscriptions/#{customer_1.id}", headers: headers, params: update_params

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Couldn't find Subscription with [WHERE \"subscriptions\".\"customer_id\" = $1 AND \"subscriptions\".\"tea_id\" = $2]")        
      end
    end
  end

  describe "#index" do
    context "when customer id is provided" do
      let!(:subscription_1) { create(:subscription, customer_id: customer_1.id, tea_id: tea_1.id, status: 0) }
      let!(:subscription_2) { create(:subscription, customer_id: customer_1.id, tea_id: tea_2.id, status: 0) }
      let!(:subscription_3) { create(:subscription, customer_id: customer_1.id, tea_id: tea_3.id, status: 1) }
      let(:index_params) do
        {
          customer_id: customer_1.id
        }.as_json
      end

      it "returns status 200 and all customer subscriptions" do
        get "/api/v0/subscriptions", headers: headers, params: index_params

        index_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(index_response).to have_key(:data)
        expect(index_response[:data].count).to eq(3)
      end
    end

    context "when an invalid customer id is provided" do
      let!(:subscription_1) { create(:subscription, customer_id: customer_1.id, tea_id: tea_1.id, status: 0) }
      let!(:subscription_2) { create(:subscription, customer_id: customer_1.id, tea_id: tea_2.id, status: 0) }
      let!(:subscription_3) { create(:subscription, customer_id: customer_1.id, tea_id: tea_3.id, status: 1) }
      let(:index_params) do
        {
          customer_id: 1000000
        }.as_json
      end

      it "returns status 422" do
        get "/api/v0/subscriptions", headers: headers, params: index_params

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Couldn't find Customer with 'id'=1000000")
      end
    end
  end
end