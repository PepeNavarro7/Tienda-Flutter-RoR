require "application_system_test_case"

class TiendasTest < ApplicationSystemTestCase
  setup do
    @tienda = tiendas(:one)
  end

  test "visiting the index" do
    visit tiendas_url
    assert_selector "h1", text: "Tiendas"
  end

  test "creating a Tienda" do
    visit tiendas_url
    click_on "New Tienda"

    fill_in "Ubicacion", with: @tienda.ubicacion
    click_on "Create Tienda"

    assert_text "Tienda was successfully created"
    click_on "Back"
  end

  test "updating a Tienda" do
    visit tiendas_url
    click_on "Edit", match: :first

    fill_in "Ubicacion", with: @tienda.ubicacion
    click_on "Update Tienda"

    assert_text "Tienda was successfully updated"
    click_on "Back"
  end

  test "destroying a Tienda" do
    visit tiendas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tienda was successfully destroyed"
  end
end
