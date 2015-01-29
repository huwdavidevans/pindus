class Pic < ActiveRecord::Base
    acts_as_taggable

    has_attached_file :image, styles: {
        original: '5000x5000>',
        thumb: '300x300>',
        preview: '960x720>'
    }, 
    :convert_options => { :all => '-auto-orient' },
    :path => ":attachment/:id/:style/:filename"

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    before_save :extract_dimensions
    serialize :dimensions

    def isPortrait?
        width, height = dimensions
        width < height
    end

    def isLandscape?
        !isPortrait?
    end

    private
    # Retrieves dimensions for image assets
    # @note Do this after resize operations to account for auto-orientation.
    def extract_dimensions
      tempfile = image.queued_for_write[:original]
      unless tempfile.nil?
        geometry = Paperclip::Geometry.from_file(tempfile)
        self.dimensions = [geometry.width.to_i, geometry.height.to_i]
      end
    end

end