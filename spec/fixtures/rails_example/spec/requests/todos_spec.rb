require "rails_helper"

RSpec.describe "Todos", :type => :request do

  # letBANG because `before {expected_todos}` looks funny
  let!(:expected_todos) do
    3.times.map do |i|
      Todo.create(title: "Todo #{i+1}")
    end
  end

  it "lists all todos" do
    get "/todos"
    todos = extract_key_from_response("todos", response)
    expect(todos.count).to eq expected_todos.count
  end

  def extract_key_from_response(key, response)
    json_response = JSON.parse(response.body)
    expect(json_response).to have_key key
    json_response[key]
  end

end
