class WhipMpegts < Formula
  desc "MPEG-TS WHIP client"
  homepage "https://github.com/Eyevinn/whip-mpegts"
  url "https://github.com/Eyevinn/whip-mpegts/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e8c7f315ca13b1d47832a320cb07a26d351a65e4aa3ade1abfe4bd7ab6c14c0e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/Eyevinn/homebrew-tools/releases/download/whip-mpegts-0.3.0"
    sha256 cellar: :any, big_sur: "0b6e990cfd53a702278ef98708cf899439fc2b783c8c6a7949c1b25b8d4b735a"
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
