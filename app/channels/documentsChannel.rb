class DocumentsChannel < ApplicationCable::Channel
  def subscribed
    @document = Document.find_or_create_by(id: params[:document])
    puts @document.inspect
    stream_for @document
    broadcast_to(@document, { action: 'set', data: @document.data })
  end

  def test(data)
    broadcast_to(@document, { action: 'change', data: data['data'], user: data['user'] })
  end
end
