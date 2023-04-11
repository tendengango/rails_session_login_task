class SessionsController < ApplicationController
    skip_before_action :login_required, only: [:new, :create]
      def new
      end
      def create
          user = User.find_by(email: params[:session][:email].downcase)
          if user&.authenticate(params[:session][:password])
              session[:user_id] = user.id
              log_in(user) #appel de la method log_in dans le controller session
              #redirect_to tasks_path
              #redirect_to tasks_path(user.id)
              redirect_to user_path(current_user.id)
              # ログイン成功した場合
            else
              # ログイン失敗した場合
              flash.now[:danger] = 'Je n\'ai pas réussi à me connecter'
              render :new
            end
      end
      def destroy
        session.delete(:user_id)
        flash[:notice] = 'Vous avez été déconnecté.'
        redirect_to new_session_path
      end
  end
  