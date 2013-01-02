class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  
  respond_to :html, :json
  
  def index
	 respond_with(@tasks = Task.all)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
	 
    respond_to do |format|
      format.html {render :partial => 'tasks/form', :layout => false}
      format.json { render :json => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    
    @task.account_id = current_user.account.id if @task .account_id == nil
	 @task.created_by = current_user.id if @task.created_by == nil    

    respond_to do |format|
      if @task.save
        format.html {render :partial => 'tasks/item', :locals => {:task => @task}, :layout => false}
        format.json { render :json => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, :notice => 'Task was successfully updated.' }
        format.json { respond_with_bip(@task)}
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@task)}
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { render :layout => false }
      format.json { head :no_content }
    end
  end
end
