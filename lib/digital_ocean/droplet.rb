module DigitalOcean
  class Droplet
    class << self
      def all(tag: )
        DigitalOcean.configuration.client
          .droplets.all(tag_name: tag).map { |d|

          new(id: d.id)
        }
      end
    end

    attr_reader :id, :size, :region, :name, :tags

    def initialize(size: nil, region: nil, image_name: nil,
                   ssh_key_name: nil, id: nil)
      @size = size
      @region = region
      @image_name = image_name
      @ssh_key_name = ssh_key_name
      @name = "#{@image_name}-#{Time.now.strftime("%F.%H%M")}"
      @id = id
      @client = DigitalOcean.configuration.client
    end

    def start
      @droplet = @client.droplets.create(
        DropletKit::Droplet.new(
          :name => @name,
          :size => @size,
          :region => @region,
          :image => image_id,
          :ssh_keys => ssh_keys,
          :tags => tags
        )
      )
      @id = @droplet.id if @droplet
      @droplet
    end

    def destroy
      raise "No Droplet ID" if id.blank?
      @client.droplets.delete(id: @id)
    end

    private

    def image_id
      @_image_id ||= @client.images.all.select{ |x|
        x.name == @image_name
      }.first.id
    end

    def ssh_keys
      @_ssh_keys ||= begin
                       key_id = @client.ssh_keys.all.select{ |x|
                         x.name == @ssh_key_name
                       }.first.id
                       [key_id]
                     end
    end

    def tags
      [@image_name, @region, :by_jarvis]
    end
  end
end
