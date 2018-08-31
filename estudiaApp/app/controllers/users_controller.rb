class UsersController < ApplicationController
before_action :authenticate_user! , only: [:create,:new,:show]

    def show
        @user = User.find(current_user.id)
        @teacher = current_user.teachers.new
        @student = current_user.students.new
    end


end
