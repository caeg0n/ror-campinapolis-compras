class RankingsController < ApplicationController
  before_action :set_ranking, only: [:show, :update, :destroy]

  def index
    @rankings = Ranking.all
    render json: @rankings
  end

  # def show
  #   render json: @ranking
  # end

  def create
    organization_id = ranking_params["organization_id"]
    hearts = ranking_params["hearts"]
    stars = ranking_params["stars"]
    temp = Ranking.where(organization_id:organization_id)
    if temp.count > 0
      temp.first.hearts = temp.first.hearts + hearts if hearts > 0
      temp.first.stars = temp.first.stars + stars if stars > 0 
      temp.first.hearts_votes = temp.first.hearts_votes + 1 if hearts > 0 
      temp.first.star_votes = temp.first.star_votes + 1 if stars > 0 
      temp.first.save
    else
      ranking = Ranking.new(ranking_params)
      ranking.hearts_votes = 0 if hearts == 0 
      ranking.star_votes = 0 if stars == 0 
      ranking.hearts_votes = 1 if hearts > 0 
      ranking.star_votes = 1 if stars > 0 
      ranking.save
    end
    render json: "ok", status: :created
  end

  # def update
  #   if @ranking.update(ranking_params)
  #     render json: @ranking
  #   else
  #     render json: @ranking.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @ranking.destroy
  # end

  private
    def set_ranking
      @ranking = Ranking.find(params[:id])
    end

    def ranking_params
      params.require(:ranking).permit(:organization_id, :hearts, :hearts_votes, :stars, :star_votes)
    end
end
