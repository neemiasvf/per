class AnalysesController < HomeController
  before_action :set_analysis, only: [:show, :edit, :update, :destroy, :queue]

  def index
    @analyses = Analysis.all
  end

  def show
  end

  def new
    @analysis = Analysis.new
  end

  def edit
  end

  def create
    @analysis = Analysis.new(analysis_params)

    respond_to do |format|
      if @analysis.save
        format.html { redirect_to @analysis, notice: 'Analysis was successfully created.' }
        format.json { render :show, status: :created, location: @analysis }
      else
        format.html { render :new }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to @analysis, notice: 'Analysis was successfully updated.' }
        format.json { render :show, status: :ok, location: @analysis }
      else
        format.html { render :edit }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @analysis.destroy
    respond_to do |format|
      format.html { redirect_to analyses_url, notice: 'Analysis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def queue
    respond_to do |format|
      if AnalyzerJob.perform_later(@analysis)
        format.html { redirect_to @analysis, notice: 'Analysis was successfully queued.' }
        format.json { render :show, status: :created, location: @analysis }
      else
        format.html { redirect_to analyses_url, notice: 'It was not possible to queue the analysis at this moment.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_analysis
      @analysis = Analysis.find(params[:id])
    end

    def analysis_params
      params.require(:analysis).permit(:gene_id, :number_splices, :intron_min_length, :intron_max_length, :exon_min_length, :exon_max_length, :acceptor_cutoff, :donor_cutoff, :display_stop, :display_cu, :cu_size)
    end
end
