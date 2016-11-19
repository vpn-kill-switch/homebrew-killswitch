class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://bintray.com/nbari/killswitch/download_file?file_path=killswitch_0.2.1_darwin_amd64.zip"
  sha256 "c037cc2431da8795db80e603790b6debbf7427e65a7b9c9689c7267e17a6e894"
  version "0.2.1"

  def install
    bin.install "killswitch"
  end
end
