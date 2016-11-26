class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://bintray.com/nbari/killswitch/download_file?file_path=killswitch_0.2.2_darwin_amd64.zip"
  sha256 "24d4285f525e42b894a6df17d9824dedaaa404d3253d88398929a70c973beee7"
  version "0.2.2"

  def install
    bin.install "killswitch"
  end
end
