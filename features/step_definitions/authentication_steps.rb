
Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^they submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^they should see an error message$/ do
  expect(page).to have_selector('div.alert.alert-danger')
end

Given /^the user has an account$/ do
  @user = User.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^they should see their profile page$/ do
  expect(page).to have_title(@user.name)
end

Then /^they should have link Settings$/ do
  expect(page).to have_link('Settings') 
end

Then /^they should see a signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

Given /^a user visits the edit page$/ do
      visit edit_user_path
end

Then /^user click link Settings$/ do
  click_link "Settings"
end

Then /^user should have content "Update your profile"$/ do
expect(page).to have_content("Update your profile")
end

Then /^user should have title "Edit user"$/ do
expect(page).to have_title("Edit user")
end

Then /^user should have link gravatar$/ do
expect(page).to have_link "change"
end

Given /^user click Save_changes$/ do
click_button "Save changes" 
end

Then /^should have content error$/ do
expect(page).to have_content('error')
end

Then /^user should have title  new name$/ do
expect(page).to have_title(@user.name)
end

Then /^user should have selector alert-saccess$/ do
expect(page).to have_selector('div.alert.alert-success')
end

Then /^user should have link Sign out$/ do
expect(page).to have_link('Sign out', href: signout_path)
end

Then /^user reload name to eq new name$/ do
@user.name = @user.reload.name
expect(@user.name).to eq @user.name
end

Then /^user reload email to eq email$/ do
@user.email = @user.reload.email
expect(@user.email).to eq @user.email
end

Then /^the user submits valid update information$/ do
  fill_in "Name",    with: @user.name
  fill_in "Email",   with: @user.email
  fill_in "password", with: @user.password
  fill_in "Confirmation", with:@user.password_confirmation
  click_button "Save changes"
end

Then /^FactoryGirl$/ do
  @user = FactoryGirl.create(:user)
end
Then /^visit the edit page$/ do
  visit edit_user_path(@user)
end

Then /^user should have title "Sign in"$/ do
  expect(page).to have_title('Sign in')
end

Then /^see update controller for non signed$/ do
  path user_path(@user)
end

Then /^see response update$/ do
  expect(page).to have_title('Sign in')
end
