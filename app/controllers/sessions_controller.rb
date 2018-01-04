class SessionsController < ApplicationController
#登录的控制器
    def create
        @user = User.find_by(username: params[:username], password: params[:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = '登录成功'
            #redirect_to root_path
            @article=Article.new
            redirect_to @article 
        else
            flash[:notice] = "用户名或者密码不正确" 
            render action: :new
        end 
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "退出成功"
        redirect_to root_path
    end

end
