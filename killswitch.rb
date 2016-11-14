class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://bintray.com/nbari/killswitch/download_file?file_path=killswitch_0.2.0_darwin_amd64.zip"
  sha256 "9437f5eb3d03f68ec123a6bdddbcc43e8b5e6c8ac3224527d83921db9dc7b17c"
  version "0.2.0"

  def install
    bin.install "killswitch"
  end
end
