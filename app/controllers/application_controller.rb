class ApplicationController < ActionController::Base
	before_action :authenticate_user!
  protect_from_forgery with: :exception

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end
