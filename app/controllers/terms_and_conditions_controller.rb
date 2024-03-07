class TermsAndConditionsController < ApplicationController
	def index
		@termsandconditions = TermsAndCondition.all
		render json: @termsandconditions, each_serializer: TermsAndConditionSerializer
	end

	def show
		render json: @termsandcondition, each_serializer: TermsAndConditionSerializer
	end

end
