class AdminController < LoginAble::LoginAbleController
  def authorize_setting
    
    if request.get?
      @users = User.find(:all)
      @levels = Level.find(:all)
      @current_levels = []
    elsif request.xml_http_request? && request.post?
      # form submited by ajax
      user = User.find(params[:user_ids]) rescue []
      levels = Level.find(params[:levels]) rescue []
      if user.respond_to? :each
        user.each do |u|
          u.levels.replace levels
        end
      else
        user.levels.replace levels
      end
      @users = User.find(:all, :include => [:levels])
      render :partial => 'user_level_list', :layout => false
    else
      # normal form submit
      user = User.find(params[:user_ids]) rescue []
      levels = Level.find(params[:levels]) rescue []
      
      if user.respond_to? :each
        user.each do |u|
          u.levels.replace levels
        end
      else
        user.levels.replace levels
      end
      
      one_user_id = user.respond_to?(:each) ? user.first.id : user.id
      @current_levels = UserLevel.find_all_by_user_id(one_user_id).collect(&:level_id)
      @users = User.find(:all, :include => [:levels])
      @levels = Level.all
      render authorize_setting_admin_path, :layout => true
    end
  end
  
  def level_select_list
    logger.debug "params[:user_ids] is : #{params[:user_ids]}"
    user = User.find(params[:user_ids]) rescue []
    one_user_id = user.respond_to?(:each) ? user.first.id : user.id
    @current_levels = UserLevel.find_all_by_user_id(one_user_id).collect(&:level_id)
    @levels = Level.all
    render :partial => 'levels', :layout => false
  end
end
