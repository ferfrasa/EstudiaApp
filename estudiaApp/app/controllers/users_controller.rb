class UsersController < ApplicationController
before_action :authenticate_user! , only: [:create,:new,:show]

    def show
        @user = User.find(current_user.id)
        @teacher = current_user.teachers.new
        @student = current_user.students.new
        @hayTeacher =Teacher.where(user_id: current_user.id).first
        @hayStudent =Student.where(user_id: current_user.id).first
        @university =  University.joins(:students => :user).where("students.user_id = #{current_user.id}").first
        @universityT =  University.joins(:teachers => :user).where("teachers.user_id = #{current_user.id}").first
        
        
        #@nameUniversity = @naeUniversity.to_a.uniq{|u| u.nombre_university}
        
        
    end

    


end
