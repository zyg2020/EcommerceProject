require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    fill_in "Address", with: @customer.address
    fill_in "City", with: @customer.city
    fill_in "Country", with: @customer.country
    fill_in "Email", with: @customer.email
    fill_in "First name", with: @customer.first_name
    fill_in "Last name", with: @customer.last_name
    fill_in "Password", with: @customer.password
    fill_in "Postal code", with: @customer.postal_code
    fill_in "Province", with: @customer.province_id
    fill_in "Telephone", with: @customer.telephone
    fill_in "Username", with: @customer.username
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @customer.address
    fill_in "City", with: @customer.city
    fill_in "Country", with: @customer.country
    fill_in "Email", with: @customer.email
    fill_in "First name", with: @customer.first_name
    fill_in "Last name", with: @customer.last_name
    fill_in "Password", with: @customer.password
    fill_in "Postal code", with: @customer.postal_code
    fill_in "Province", with: @customer.province_id
    fill_in "Telephone", with: @customer.telephone
    fill_in "Username", with: @customer.username
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
