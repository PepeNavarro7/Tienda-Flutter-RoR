require "application_system_test_case"

class ContienesTest < ApplicationSystemTestCase
  setup do
    @contiene = contienes(:one)
  end

  test "visiting the index" do
    visit contienes_url
    assert_selector "h1", text: "Contienes"
  end

  test "creating a Contiene" do
    visit contienes_url
    click_on "New Contiene"

    fill_in "Cantidad", with: @contiene.cantidad
    fill_in "Cart", with: @contiene.cart_id
    fill_in "Producto", with: @contiene.producto_id
    click_on "Create Contiene"

    assert_text "Contiene was successfully created"
    click_on "Back"
  end

  test "updating a Contiene" do
    visit contienes_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @contiene.cantidad
    fill_in "Cart", with: @contiene.cart_id
    fill_in "Producto", with: @contiene.producto_id
    click_on "Update Contiene"

    assert_text "Contiene was successfully updated"
    click_on "Back"
  end

  test "destroying a Contiene" do
    visit contienes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contiene was successfully destroyed"
  end
end
