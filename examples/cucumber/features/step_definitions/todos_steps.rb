Given(/^(\d+) todos$/) do |num|
  num = num.to_i
  num.times do |i|
    Todo.create(title: "Title #{i}")
  end
end

When(/^I visit "(.*?)"$/) do |path|
  visit path
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_text(text)
end

Then(/^I see (\d+) todos$/) do |num|
  expect(all(".todo-item").length).to eq num.to_i
end
