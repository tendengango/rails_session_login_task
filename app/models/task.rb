class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  
    #def current_user_tasks(user)
      #@task.user_id = current_user.id
    #end
end
