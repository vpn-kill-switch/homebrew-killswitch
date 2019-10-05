class VpnKillSwitch < Formula
  desc "Create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://github.com/vpn-kill-switch/killswitch.git", :tag => "0.7.0", :revision => "b8e11177666f92608020133b07978ce09d0b615e"
  head "https://github.com/vpn-kill-switch/killswitch.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "c0bd10c385ee390792fdc49b1cb6a57afbfe7ceac142a096cf44050dacf713c3" => :mojave
    sha256 "f476743082dea51f61f169fcbc34d11f886054f90a479602d85b641e784433ea" => :high_sierra
    sha256 "d9f076f1c3010e57e77bb583ba63855f1db92e8fb0cd432cfefe79ce0d26d9b5" => :sierra
  end

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/vpn-kill-switch/killswitch").install buildpath.children
    cd "src/github.com/vpn-kill-switch/killswitch" do
      system "dep", "ensure", "-vendor-only"
      ldflags = "-s -w -X main.version=#{version}"
      system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/killswitch", "cmd/killswitch/main.go"
    end
  end

  test do
    system bin/"killswitch", "-v"
  end
end
