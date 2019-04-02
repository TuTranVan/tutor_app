class Admin::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end
end
