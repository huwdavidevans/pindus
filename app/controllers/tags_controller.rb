class TagsController < ApplicationController

    def autocomplete
        logger.debug params[:term]
        tags = ActsAsTaggableOn::Tag.named_like(params[:term]).map {|t| t.name}
        respond_to do |format|
          format.json { render :json => tags }
        end
    end

    def popular
        tags = ActsAsTaggableOn::Tag.most_used.map {|t| t.name}
        respond_to do |format|
          format.json { render :json => tags }
        end
    end
end
