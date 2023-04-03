class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "bdeb5be8495a55e9d9a129851dee30bcb1c10538ef29fc09a311faacedb86aed"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-mpegts-0.7.1"
    sha256 cellar: :any,                 monterey:     "65764d3406f7dff2f786d675b7adaf63948a561537bbef9b5c74fcab97fc40ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4197c05f1922cf503d144f3f171514bf95fa9f2c28e730401980ad9d8da56ab2"
  end

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
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
