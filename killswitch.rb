class Killswitch < Formula
  desc "Create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://github.com/vpn-kill-switch/killswitch.git", :tag => "0.7.1", :revision => "5a2a02aa0bff87a05d6d75a978e7addfcc1beed6"
  head "https://github.com/vpn-kill-switch/killswitch.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "c0bd10c385ee390792fdc49b1cb6a57afbfe7ceac142a096cf44050dacf713c3" => :mojave
    sha256 "f476743082dea51f61f169fcbc34d11f886054f90a479602d85b641e784433ea" => :high_sierra
    sha256 "d9f076f1c3010e57e77bb583ba63855f1db92e8fb0cd432cfefe79ce0d26d9b5" => :sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-mod=vendor", "-ldflags", "-s -w -X main.version=#{version}", "-o", "#{bin}/killswitch", "cmd/killswitch/main.go"
  end

  test do
    system "#{bin}/killswitch", "-v"
  end
end
