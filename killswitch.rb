class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://github.com/vpn-kill-switch/killswitch.git",
      :tag => "0.6.0",
      :revision => "44f8002eaeb100df1e10b4af6c6dafe6f0a1b5f6"
  head "https://github.com/vpn-kill-switch/killswitch.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "317718d93ca4dd4406333a94c9a950a5b77d196b075d02e255e7784ed9b4b905" => :mojave
    sha256 "64d887c755dbc3849e106b93e5b08fe074866ab506f9a923121cef930f40e90c" => :high_sierra
    sha256 "897d5bf3e2be8450405595ef3c1cb20b6514624ca89fef6752afd49e6db39901" => :sierra
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
