require 'test_helper'

class BannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banner = banners(:one)
  end

  test "should get index" do
    get banners_url
    assert_response :success
  end

  test "should get new" do
    get new_banner_url
    assert_response :success
  end

  test "should create banner" do
    assert_difference('Banner.count') do
      post banners_url, params: { banner: { long_banner_subtitle: @banner.long_banner_subtitle, long_banner_title: @banner.long_banner_title, slideshow_banner_subtitle: @banner.slideshow_banner_subtitle, slideshow_banner_title: @banner.slideshow_banner_title } }
    end

    assert_redirected_to banner_url(Banner.last)
  end

  test "should show banner" do
    get banner_url(@banner)
    assert_response :success
  end

  test "should get edit" do
    get edit_banner_url(@banner)
    assert_response :success
  end

  test "should update banner" do
    patch banner_url(@banner), params: { banner: { long_banner_subtitle: @banner.long_banner_subtitle, long_banner_title: @banner.long_banner_title, slideshow_banner_subtitle: @banner.slideshow_banner_subtitle, slideshow_banner_title: @banner.slideshow_banner_title } }
    assert_redirected_to banner_url(@banner)
  end

  test "should destroy banner" do
    assert_difference('Banner.count', -1) do
      delete banner_url(@banner)
    end

    assert_redirected_to banners_url
  end
end
