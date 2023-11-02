require "rails_helper"

RSpec.describe "customer requests" do
  describe "#create" do
    context "when first and last name, email address, and mailing address are provided, a subscriber is created" do
      it "returns status 201" do
        customer_1 = create(:customer)

        create_params = {
          "first_name": customer_1.first_name,
          "last_name": customer_1.last_name,
          "email": "myfakeemail@gmail.com",
          "address": customer_1.address
        }

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

        post "/api/v0/customers", headers: headers, params: create_params.to_json

        create_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(201)
        expect(create_response).to have_key(:message)
        expect(create_response[:message]).to eq("Successfully created Tea & Me subscriber!")
      end
    end

    context "when a first or last name field is left blank" do
      it "returns status 422" do

        customer_1 = create(:customer)

        create_params = {
          "first_name": "",
          "last_name": customer_1.last_name,
          "email": "lilkin@gmail.com",
          "address": customer_1.address
        }

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

        post "/api/v0/customers", headers: headers, params: create_params.to_json

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Validation failed: First name can't be blank")
      end
    end

    context "when an email is not unique" do
      it "returns status 422" do

        customer_1 = create(:customer)

        create_params = {
          "first_name": customer_1.first_name,
          "last_name": customer_1.last_name,
          "email": customer_1.email,
          "address": customer_1.address
        }

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

        post "/api/v0/customers", headers: headers, params: create_params.to_json

        error_response = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(422)
        expect(error_response).to have_key(:errors)
        expect(error_response[:errors][0][:detail]).to eq("Validation failed: Email has already been taken")
      end
    end
  end
end