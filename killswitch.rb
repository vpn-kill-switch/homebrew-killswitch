require "language/go"

class Killswitch < Formula
  desc "create & load a kill-switch pf.conf"
  homepage "https://vpn-kill-switch.com/"
  url "https://github.com/vpn-kill-switch/killswitch.git",
      :tag => "0.4.2",
      :revision => "763f87a995141fef1372dd8dff8f57ee28baeded"
  head "https://github.com/vpn-kill-switch/killswitch.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "179e07bb22e2755e3d082f07607cf2e98e266defaace3ceb764a4c32f03ccf8d" => :sierra
    sha256 "5be8ef01a8568b7de75b19d525a4830b0c934c43b9e8f9fb150cbdcb18091a26" => :el_capitan
    sha256 "6dcf9d7de2489f5e3d6fd56488c3abe2bff1ea6f6bf0d9de89421b0e9a7e2e38" => :yosemite
  end

  depends_on "go" => :build

  go_resource "github.com/miekg/dns" do
    url "https://github.com/miekg/dns.git",
        :revision => "e4205768578dc90c2669e75a2f8a8bf77e3083a4"
  end

  go_resource "golang.org/x/net" do
    url "https://go.googlesource.com/net.git",
        :revision => "1c05540f6879653db88113bc4a2b70aec4bd491f"
  end

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/vpn-kill-switch/killswitch").install buildpath.children
    Language::Go.stage_deps resources, buildpath/"src"
    cd "src/github.com/vpn-kill-switch/killswitch" do
      ldflags = "-s -w -X main.version=#{version}"
      system "go", "build", "-ldflags", ldflags, "-o", "#{bin}/killswitch", "cmd/killswitch/main.go"
    end
  end

  test do
    system bin/"killswitch", "-v"
  end
end
