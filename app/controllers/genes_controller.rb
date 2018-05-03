class GenesController < SbadminController
  before_action :set_gene, only: [:show, :edit, :update, :destroy]

  def index
    @genes = Gene.all
  end

  def show
  end

  def new
    @gene = Gene.new
  end

  def edit
  end

  def create
    @gene = Gene.new(gene_params)

    respond_to do |format|
      if @gene.save
        format.html { redirect_to @gene, notice: 'Gene was successfully created.' }
        format.json { render :show, status: :created, location: @gene }
      else
        format.html { render :new }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gene.update(gene_params)
        format.html { redirect_to @gene, notice: 'Gene was successfully updated.' }
        format.json { render :show, status: :ok, location: @gene }
      else
        format.html { render :edit }
        format.json { render json: @gene.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gene.destroy
    respond_to do |format|
      format.html { redirect_to genes_url, notice: 'Gene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_gene
      @gene = Gene.find(params[:id])
    end

    def gene_params
      params.require(:gene).permit(:name, :original_sequence, :user_id)
    end
end
