class TestsController < ApplicationController

  def index
    #  render plain: "Вопросы теста: #{@test.questions.inspect}"
    # render inline: 'Вопросы теста: <%= @test.questions.inspect %>'
    # render html: '<h1>All tests</h1>'.html_safe
    # render json: { tests: Test.all }
    # render inline: '<p>Вопросы теста: <%= %[ybuR].reverse! %>!</p>'
    # render file: 'public/about.html', layout: false
    # head 204
    # head :no_content

    # byebug

    # render inline: '<%= console %>'

    # logger.info(self.object_id)
    # byebug
    # render plain: 'All tests'
    # respond_to do |format|
      # format.html { render plain: 'All tests'}
      # format.json { render json: { tests: Test.all } }
    # end


  # /tests?level=2&lang=ru
# /tests?data%5Blevel%5D=2&data%5Blang%5D=ru
# /tests?tags%5B%5D=ruby&tags%5B%5D=computer%20science
# /tests?data%5B%5D%5Blevel%5D=1&data%5B%5D%5Blevel%5D=2

    result = ["Class: #{params.class}", "Parametrs: #{params.inspect}"]

    render plain: result.join("\n")
  end

    def show
      # render json: { tests: Test.find}
      # byebug
      redirect_to root_path 
    end

    def new
        
    end
    
def create
  # result = ["Class: #{params.class}", "Parametrs: #{params.inspect}"]

  # render plain: result.join("\n")

  test = Test.create(test_params)
  render plain: test.inspect
end

private

def test_params
  # Category.find(params[:category_id])
  params.require(:tests).permit(:title, :level, :category_id, :author_id)  

end


end
