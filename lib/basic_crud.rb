require "basic_crud/version"

module BasicCrud
  def index
    @records = model.all

    yield if block_given?

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @records }
    end
  end

  def show
    @record = fetch_record_by_param

    yield if block_given?

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @record }
    end
  end

  def edit
    @record = fetch_record_by_param
    yield if block_given?
  end

  def new
    @record = model.new
    yield if block_given?
  end

  def create
    @record = model.new(restricted_params)
    @notice = "#{model} was successfully created."
    yield if block_given?

    respond_to do |format|
      if @record.save
        format.html { redirect_to action: :index, notice: @notice }
        format.json { render @record, status: :created }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @record = fetch_record_by_param
    @notice = "#{model} was successfully updated."

    yield if block_given?

    respond_to do |format|
      if @record.update(restricted_params)
        format.html { redirect_to @record, notice: @notice }
        format.json { render @record, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record = fetch_record_by_param
    @notice = "#{model} was successfully destroyed."

    yield if block_given?

    @record.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: @notice }
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
    #params.require(self.controller_name.classify.underscore.to_sym).permit([])
    raise("No strong params set, override restricted_params method in your controller. E.g. params.require(:model).permit(:attribute1, :attribute2)")
  end
end
