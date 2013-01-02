class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
	 @comment.commentable_type = params[:commentable_type]
	 @comment.commentable_id = params[:commentable_id]
	 
	 # Sort out what we're attaching this too so we can list it out properly in the template
	 var_name = params[:commentable_type].downcase
	 instance_variable_set("@#{var_name}", params[:commentable_type].constantize.find_by_id(params[:commentable_id]))
	 	 
    respond_to do |format|
      format.html do
      	if request.xhr?
      		render :partial => 'comments/modal_form', :locals => {:comment => @comment, :parent => instance_variable_get("@#{var_name}")}, :layout => false
      	else
      	
      	end
      end
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
	 @comment.account_id = current_user.account.id if @comment.account_id == nil
	 @comment.created_by = current_user.id if @comment.created_by == nil
	 
	 var_name = params[:comment][:commentable_type].downcase
	 instance_variable_set("@#{var_name}", params[:comment][:commentable_type].constantize.find_by_id(params[:comment][:commentable_id]))
	 
	 # In case people want to immediately post another comment...
	 @new_comment = Comment.new
	 @new_comment.commentable_type = params[:comment][:commentable_type]
	 @new_comment.commentable_id = params[:comment][:commentable_id]
	 
    respond_to do |format|
      if @comment.save
        format.html do       
      	if request.xhr?
      		render :partial => 'comments/modal_form', :locals => {:comment => @new_comment, :parent => instance_variable_get("@#{var_name}")}, :layout => false
      	else
      	   redirect_to @comment, :notice => 'Comment was successfully created.'
      	end
       end
        
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
