require "application_system_test_case"

class PrisonarsTest < ApplicationSystemTestCase
  setup do
    @prisonar = prisonars(:one)
  end

  test "visiting the index" do
    visit prisonars_url
    assert_selector "h1", text: "Prisonars"
  end

  test "creating a Prisonar" do
    visit prisonars_url
    click_on "New Prisonar"

    fill_in "Code", with: @prisonar.code
    fill_in "Lose count", with: @prisonar.lose_count
    fill_in "Name", with: @prisonar.name
    fill_in "Win count", with: @prisonar.win_count
    click_on "Create Prisonar"

    assert_text "Prisonar was successfully created"
    click_on "Back"
  end

  test "updating a Prisonar" do
    visit prisonars_url
    click_on "Edit", match: :first

    fill_in "Code", with: @prisonar.code
    fill_in "Lose count", with: @prisonar.lose_count
    fill_in "Name", with: @prisonar.name
    fill_in "Win count", with: @prisonar.win_count
    click_on "Update Prisonar"

    assert_text "Prisonar was successfully updated"
    click_on "Back"
  end

  test "destroying a Prisonar" do
    visit prisonars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prisonar was successfully destroyed"
  end
end
