class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :load_swit

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @comments = @swit.comments.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @swit.comments.new
  end

  # GET /comments/1/edit
  def edit
    @comment = @swit.comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @swit.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to swits_path}
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update

    @comment = @swit.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@swit, @comment], notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @swit.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to swit_comments_url(@swit) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:swit_id, :body, :author)
    end

    def load_swit
      @swit = Swit.find(params[:swit_id])
    end
end
