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

    def list
        @tagIndexes = allAvailableTagIndexes
        @tags = ActsAsTaggableOn::Tag.all.order(:name).page(params[:page]).per_page(64)
        @groupedTags = @tags.group_by{|tag| tag.name[0]}
    end

    def alphaList
        @tagIndexes = allAvailableTagIndexes
        @prefix = params[:prefix]
        @tags = ActsAsTaggableOn::Tag.where("name LIKE '#{@prefix}%'").order(:name).page(params[:page]).per_page(64)
    end

    private

    def allAvailableTagIndexes
        ActsAsTaggableOn::Tag.all.collect{|tag| tag[0]}.uniq.sort
    end


end
