require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  setup do
    @home = homes(:one)
  end

  test "visiting the index" do
    visit homes_url
    assert_selector "h1", text: "Tags"
  end

  test "creating a Home" do
    visit homes_url
    click_on "New Home"

    fill_in "Descricao", with: @home.descricao
    fill_in "Imagem", with: @home.imagem
    fill_in "Nome", with: @home.nome
    click_on "Create Tag"

    assert_text "Tag was successfully created"
    click_on "Back"
  end

  test "updating a Home" do
    visit homes_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @home.descricao
    fill_in "Imagem", with: @home.imagem
    fill_in "Nome", with: @home.nome
    click_on "Update Home"

    assert_text "Tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Home" do
    visit homes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag was successfully destroyed"
  end
end
