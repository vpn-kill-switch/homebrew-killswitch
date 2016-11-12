class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://bintray.com/nbari/killswitch/download_file?file_path=killswitch_0.1.0_darwin_amd64.zip"
  sha256 "69ffb2784b16f15daa74453640968ce8ae24075bcaecc7929cb96476b04f0b0c"
  version "0.1.0"

  def install
    bin.install "killswitch"
  end
end
