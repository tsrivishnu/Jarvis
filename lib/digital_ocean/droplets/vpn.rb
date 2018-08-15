module DigitalOcean
  module Droplets
    class VPN < Droplet
      class << self
        def all
          super(tag: :openvpn)
        end
      end

      def initialize(id: nil)
        if !id.blank?
          super(id: id)
        else
          super(
            size: "s-1vcpu-1gb",
            region: "blr1",
            image_name: "openvpn",
            ssh_key_name: "MacBook Pro - Munna"
          )
        end
      end
    end
  end
end
