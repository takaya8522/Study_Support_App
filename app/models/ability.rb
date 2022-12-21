# cancancan用のモデル
class Ability
  include CanCan::Ability

  def initialize(user)

    # ログインしているかつadminカラムがtrueの場合
    if user && user.admin?
      # 全ての機能を使えるように設定
      can :manage, :all
      can :access_admin_users_page, :all
    end
  end
end
