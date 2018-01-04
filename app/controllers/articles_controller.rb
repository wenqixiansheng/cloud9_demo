class ArticlesController < ApplicationController
    #除了index和show不需要认证，其他的都需要认证才能删除操作
    http_basic_authenticate_with name:
    "123", password: "123", except: [:index, :show]
    
    def index
        @articles = Article.all  #显示所有的数据（articles）
    end

    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)  #更新成功
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    
    
    #create是固定的名字（用来处理view数据）
    def create
        @article = Article.new(article_params)    #Article类的一个实例对象
        #保存对象到数据库articles表中    Article是一个模型（类）
        if @article.save
            redirect_to @article
        else
            render 'new'   #保存失败
        end
    end
    #删除数据
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
    
    
    private
        #获取表单数据
        def article_params
            params.require(:article).permit(:title, :text)
        end
end
