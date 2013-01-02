class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = Attachment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new
	
    respond_to do |format|
      format.html 
      format.json { render :json => @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(params[:attachment])
    @attachment.attachment = params[:attachment]
    @attachment.account_id = current_user.account.id if @attachment .account_id == nil
	 @attachment.created_by = current_user.id if @attachment.created_by == nil
	 @attachment.save!
	 
    respond_to do |format|
      if @attachment.save
        format.html do 
	        	if request.xhr? 
	        		render :partial => 'attachments/thumb', :locals => {:attachment => @attachment}, :layout => false, :status => :created
	        	else
	        		redirect_to @attachment, :notice => 'Attachment was successfully created.'
	        	end
        end
        
        format.json { render :json => @attachment, :status => :created, :location => @attachment }
      else
        format.html do 
	        	if request.xhr? 
	        		render :json => @attachment.errors, :status => :unprocessable_entity
	        	else
	        	end
        end

        format.json { render :json => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find(params[:id])
    @attachment.attachment = params[:attachment]
    @attachment.account_id = current_user.account.id if @attachment .account_id == nil
	 @attachment.created_by = current_user.id if @attachment.created_by == nil
	 @attachment.save!


    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to @attachment, :notice => 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @attachment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
     	 format.html do
     	 	if request.xhr? 
     	 		render :layout => false
     	 	end
     	 end
      format.json { head :no_content }
    end
  end
end
