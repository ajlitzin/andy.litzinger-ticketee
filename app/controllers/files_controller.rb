class FilesController < ApplicationController
  before_filter :authenticate_user!

  def show
    asset = Asset.find(params[:id])
    if can?(:view, asset.ticket.project)
      send_file asset.asset.path, filename: asset.asset_file_name,
                                content_type: asset.asset.content_type
    else
      flash[:alert] = "The asset you were looking for could not be found."
      redirect_to root_path
    end
  end

  def new
    @ticket = Ticket.new
    @ticket.assets.build
    render partial: "files/from",
           locals: { number: params[:number].to_i,
            asset: asset }
  end
end
