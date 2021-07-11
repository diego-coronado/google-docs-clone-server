class DocumentsController < ApplicationController
  # before_action :set_document, only: [:update]
  skip_before_action :verify_authenticity_token

  def update
    document = Document.find_by(slug: params[:slug])
    document.data = params[:data].to_s
    document.save
  end

  private

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:document).permit(:slug, :data)
  end
end
