class ArticlesController < ApplicationController
   #before_action :validate_user , except:[:show,:index]	#Callback
   before_action :authenticate_user! , only: [:create,:new]  # sirve con devise
   before_action :set_article , except: [:index,:new,:create]
   before_action :authenticate_editor! , only: [:create,:new,:update] 
   before_action :authenticate_admin! , only: [:destroy,:publish]  
  #GET /articles listar los articulos
   def index
  	#para accceder a la vista variable de clase
     #@articles = Article.all
     #@articles = Article.where(state: "published")
     #@articles = Article.Published #con maquina de estados
     @articles = Article.paginate(page: params[:page], per_page:2).publicados.ultimos #con maquina de estados
     
   end
   #GET /articles/:id
   def show
   	  #@article = Article.find(params[:id])	
   	  @article.update_visits_count
   	  @comment = Comment.new	
   end

   #GET /articles/new
   #con el new el objeto no es persistente	
   def new
        @article = Article.new
        @category_as= CategoryA.all
   end
   # post  /articles  para crear en la base de datos 
   def create
   	   #@article = Article.new(title: params[:article][:title],
   	   	#body: params[:article][:body])
       @article = current_user.articles.new(article_params)
       puts 'entro a crear articulo #{@article}' 
      # @article.category_as = params[:category_as]
        #puts  @article.category_as.inspect
       if @article.save
         redirect_to @article
       else
         render :new
       end 
   end

   def destroy
   	   # @article = Article.find(params[:id])
   	    @article.destroy
   	    redirect_to articles_path
   end

   def edit
   	   # @article = Article.find(params[:id])
   end

   def update
	   #@article = Article.find(params[:id])
	   if @article.update(article_params)
	   	  redirect_to @article
	   else
	   	  render :edit
	   end 
   end

   def publish
     @article.publish! #metodo creado con la maquina estados
     redirect_to @article
   end
   

   private

   def set_article
   	  @article = Article.find(params[:id])		
   end

   def validate_user
      redirect_to new_user_session_path, notice: "Necesitar iniciar sesión"
   end

   def article_params
   	 params.require(:article).permit(:title,:body,:cover,:category_as=> [])  #campos que permite al realiza un registro
   end
       
end