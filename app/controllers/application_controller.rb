class ApplicationController < ActionController::Base
    include SessionsHelper #ajouter ici pour inclure helpers/sessions_helper
    before_action :login_required
    
    private

    def login_required #Cette méthode interdit l'accès aux utilisateurs non connectés
      redirect_to new_session_path unless current_user
    end

end

