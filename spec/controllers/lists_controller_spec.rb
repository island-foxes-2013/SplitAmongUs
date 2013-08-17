require 'spec_helper'

describe ListsController do

  let(:list) { List.new(name: "Awesome List") }

  describe "GET #new" do
    it "assigns a new List, through the current user to @list"
    it "renders the new partial template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new list in the database"
      it "redirects to the dashboard page"
    end

    context "with invalid attributes" do
      it "does not save the new list in the database"
      it "renders the error message and redirects to the dashboard page"
    end
  end 
end