require 'openssl'
include OpenSSL

module HyperledgerCli
  class Key
    def initialize(public_key = nil)
      @key = if public_key
          PKey::EC.new(File.open(path(public_key)).read)
        else
          PKey::EC.new("secp256k1").generate_key
        end
    end
    
    def path(public_key = nil)
      root = "#{ENV['HOME']}/.hyperledger"
      if public_key
        "#{root}/#{public_key}.pem"
      else
        root
      end
    end
    
    def write
      FileUtils.mkdir_p path
      open path(public_key), 'w' do |io|
        io.write @key.to_pem
      end
    end
    
    def public_key
      @key.public_key.to_bn.to_s(16)
    end
    
    def sign(message)
      digest = Digest::SHA256.digest(message)
      signature = @key.dsa_sign_asn1(digest)
      signature.unpack("H*").first.upcase
    end
  end
end