class ReportPdf < Prawn::Document
  def initialize(order, user)
    super()
    @order = order
    @user = user
    header
    text_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/banner1.png", width: 530, height: 150
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([150, y_position], :width => 270, :height => 300) do
      image "#{Rails.root}/app/assets/images/money.jpg", width: 200, height: 200
    end

    bounding_box([170, y_position - 220], :width => 270, :height => 300) do
      text "#{@order.product.name}", size: 15, style: :bold
      text "total: #{@order.total}"
      text "quantity: #{@order.quantity}"
      text "address: #{@order.address}"
      text "phone: #{@order.phone}"
      text "ordered by: #{@user.username}"
      text "ordered at: #{@order.created_at.to_s.gsub!(/UTC.*\z/, '')}"
    end

  end


end