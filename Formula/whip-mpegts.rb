class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7cce8b3c57627e12f2138ff7d09b8f7aa7002d048f426cd65a6cbf4646a483ed"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-mpegts-0.4.0"
    sha256 cellar: :any,                 big_sur:      "62ff53c08b25c9c866a2e8b88b3ecf01501b4d88353962180a09b1fbaf74a497"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e66fbd29318d13eff9daddcffc1fad374c88986ddc2e4086cabb1433b8aa080c"
  end

  depends_on "cmake" => :build
  depends_on "gst-libav"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-base"
  depends_on "gstreamer"
  depends_on "libsoup@2"

  def install
    system "cmake", "-DCMAKE_BUILD_TYPE=Release", "-G", "Unix Makefiles", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    output = shell_output("#{bin}/whip-mpegts", 1).strip
    assert_match "Usage: whip-mpegts", output
  end
end
