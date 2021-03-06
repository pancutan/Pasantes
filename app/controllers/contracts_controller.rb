class ContractsController < ApplicationController
  #Solo cuando en application_controller esta seteado como before_filter :authorize
  #skip_before_filter :authorize, :only => [:new, :create, :update, :edit, :show]

  #Activando autorizacion por CONTROLADOR, no GENERAL
  before_filter :authorize

  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contract }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def cm
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contract = Contract.new
    @users = User.all
    @internships = Internship.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contract }
    end
  end

  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
    @users = User.all
    @internships = Internship.all
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])
    @users = User.all
    @internships = Internship.all

    respond_to do |format|
      if @contract.save
        format.html { redirect_to :action => 'index' }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])
    @users = User.all
    @internships = Internship.all

    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to @contract, :notice => 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contract.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url }
      format.json { head :no_content }
    end
  end

  def redactarme
    #debugger
    @contract = Contract.new

    @internship = Internship.find(params[:id])

    @contract.internship_id = @internship.id #proveniente de internships index

    elpelotudodecarrizo = User.find(session[:user_id])

    elpelotudodecarrizo.contracts.each do |i|
      i.destroy
    end

    @contract.user_id = elpelotudodecarrizo.id

    @contract.save
  end

  def imprimirmeci
    @contract = Contract.find_by_user_id(params[:id])
    respond_to do |format|
          format.html { redirect_to @contract }
          format.json { head :no_content }
    end
  end

  def imprimirmecm
    @contract = Contract.find_by_user_id(params[:id])
    respond_to do |format|
          format.html { render :action => "cm" }
    end
  end

end
