class PhasesController < ApplicationController
  # GET /phases
  # GET /phases.json
  def index
    @phases = Phase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @phases }
    end
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
    @phase = Phase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @phase }
    end
  end

  # GET /phases/new
  # GET /phases/new.json
  def new
    @phase = Phase.new
	 @phase.project_id = params[:project_id] if params[:project_id]	 
	 
    respond_to do |format|
      format.html {render :partial => 'phases/form', :layout => false}
      format.json { render :json => @phase }
    end
  end

  # GET /phases/1/edit
  def edit
    @phase = Phase.find(params[:id])
  end

  # POST /phases
  # POST /phases.json
  def create
    @phase = Phase.new(params[:phase])
	 @phase.account_id = current_user.account.id if @phase.account_id == nil
	 @phase.created_by = current_user.id if @phase.created_by == nil
	 @task = Task.new
	 
    respond_to do |format|
      if @phase.save
        format.html {render :partial => 'phases/item', :locals => {:p => @phase}, :layout => false}
        format.json { render :json => @phase, :status => :created, :location => @phase }
      else
        format.html { render :action => "new" }
        format.json { render :json => @phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /phases/1
  # PUT /phases/1.json
  def update
    @phase = Phase.find(params[:id])

    respond_to do |format|
      if @phase.update_attributes(params[:phase])
        format.html { redirect_to @phase, :notice => 'Phase was successfully updated.' }
        format.json { respond_with_bip(@phase)}
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@phase)}
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    @phase = Phase.find(params[:id])
    @phase.destroy

    respond_to do |format|
      format.html { render :layout => false }
      format.json { head :no_content }
    end
  end
end
