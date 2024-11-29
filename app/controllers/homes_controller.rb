class HomesController < ApplicationController
  def top
  end
  def destroy
    # ログアウト時の処理
    reset_session  # セッションを破棄
  
    flash[:notice] = "Signed out successfully."
    redirect_to users_path
end
end