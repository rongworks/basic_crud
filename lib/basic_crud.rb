require "basic_crud/version"

module BasicCrud
  def index
    @records = model.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @records }
    end
  end

  def show
    @record = fetch_record_by_param

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @record }
    end
  end

  def edit
    @record = fetch_record_by_param
  end

  def new
    @record = model.new
  end

  def create
    @record = model.new(restricted_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to action: :index, notice: "#{model} was successfully created." }
        format.json { render @record, status: :created }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @record = fetch_record_by_param
    respond_to do |format|
      if @record.update(restricted_params)
        format.html { redirect_to @record, notice: "#{model} was successfully updated." }
        format.json { render @record, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record = fetch_record_by_param
    @record.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: "#{model} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # default record by id for show, edit, ..
  def fetch_record_by_param
    model.find(params[:id])
  end

  # Derive model from ControllerClass (ThingsController => Thing)
  def model
    self.controller_name.classify.constantize
  end

  # Override this method to allow model attributes
  def restricted_params
    params.require(self.controller_name.classify.underscore.to_sym).permit([])
  end
end
