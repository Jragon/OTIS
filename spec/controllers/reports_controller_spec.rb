require 'spec_helper'

describe ReportsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'village'" do
    it "returns http success" do
      get 'village'
      response.should be_success
    end
  end

  describe "GET 'national_office'" do
    it "returns http success" do
      get 'national_office'
      response.should be_success
    end
  end

  describe "GET 'regional_office'" do
    it "returns http success" do
      get 'regional_office'
      response.should be_success
    end
  end

  describe "GET 'programme'" do
    it "returns http success" do
      get 'programme'
      response.should be_success
    end
  end

  describe "GET 'world_vision'" do
    it "returns http success" do
      get 'world_vision'
      response.should be_success
    end
  end

end
