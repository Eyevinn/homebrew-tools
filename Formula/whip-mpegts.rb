class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "e8e59e74cd294ab819e2b08ffee66bd9a3600d672e8ac519b075ccad30ff8996"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-mpegts-0.5.0"
    sha256 cellar: :any,                 big_sur:      "c63a6e82d595acd869bdb631f82664d85687b17508616ef0565642d98cbb6152"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f35d8ff85d84ae5b38eaf0b450c5c28b29440a86b33326162a37684372abe827"
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
