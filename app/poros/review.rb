class Review
  attr_reader :id,
              :author,
              :content
              
  def initialize(review_data)
    @id = review_data[:id]
    @author = review_data[:author]
    @content = review_data[:content]
  end
end