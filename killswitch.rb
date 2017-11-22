class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://github.com/vpn-kill-switch/killswitch.git",
      :tag => "0.5.1",
      :revision => "172bdb03031304958a2466ab994b159eeb9ed43c"
  head "https://github.com/vpn-kill-switch/killswitch.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "af1a49059071713a330692106f9309911c398d375c425481702b812406e01547" => :high_sierra
    sha256 "2744498ed27a3e7401cf8905a01498e10cb898d8e6786763907f59f64c1cac75" => :sierra
    sha256 "33cf0dae84b792e44e256a9fec29e08e0d0ae3ad2598470f0b2328be200b3adc" => :el_capitan
  end

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/vpn-kill-switch/killswitch").install buildpath.children
    cd "src/github.com/vpn-kill-switch/killswitch" do
      system "dep", "ensure"
      ldflags = "-s -w -X main.version=#{version}"
      system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/killswitch", "cmd/killswitch/main.go"
    end
  end

  test do
    system bin/"killswitch", "-v"
  end
end
