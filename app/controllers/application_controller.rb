class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_items_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      root_path              #ここもpathはご自由に変更してください
    end
  end



end
