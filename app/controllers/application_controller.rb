class ApplicationController < ActionController::Base
  before_action :authenticate_user!, expect: [:top]
  # :authenticate_user!はdeviseが用意したメソッド。これだけで「ログインされていなければログイン画面にリダイレクトする」を指示
  # expect: [:top]はtopページを除外する = topページだけはログインされていなくても表示できる
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  # 引数(resource)にはログインしたユーザーのインスタンスが格納されている
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end


  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
