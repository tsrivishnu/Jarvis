module DigitalOcean
  class Droplet
    def initialize(size: "s-1vcpu-1gb", region: "blr1",
                   image_name: "openvpn",
                   ssh_key_name: "MacBook Pro - Munna")
      @size = size
      @region = region
      @image_name = image_name
      @ssh_key_name = ssh_key_name
      @name = "#{@image_name}-#{Time.now.strftime("%F.%H%M")}"
      @client = DigitalOcean.configuration.client
    end

    def start
      @droplet = @client.droplets.create(
        DropletKit::Droplet.new(
          :name => @name,
          :size => @size,
          :region => @region,
          :image => image_id,
          :ssh_keys => ssh_keys
        )
      )
      @droplet
    end

    def status

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
  end
end
